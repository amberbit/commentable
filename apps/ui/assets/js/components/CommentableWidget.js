import React from "react";
import { ApolloProvider } from "react-apollo";
import { Query, Mutation } from "react-apollo";
import gql from "graphql-tag";
import queryString from 'query-string';

import client from "../client";

const Comments = () => {
  const { url } = queryString.parse(window.location.search);

  return (
    <div className="comments">
      <Query query={GET_COMMENTS} variables={{ url }}>
        {({ loading, error, data }) => {
          if (loading) return <p>Loading...</p>;
          if (error) return <p>Error :(</p>;

          return (
            <div className="comments-list">
              <AddComment url={url} />

              <h2>{data.comments.length} comment(s):</h2>
              { data.comments.map(({ id, content }) => (
                <div key={id} className="comment">{content}</div>
              ))}
            </div>
          )
        }}
      </Query>
    </div>
  );
};

const AddComment = ({url}) => {
  let input;

  return (
    <Mutation mutation={CREATE_COMMENT}
      update={(cache, { data: { createComment } }) => {
        const { comments } = cache.readQuery({ query: GET_COMMENTS, variables: { url } });
        cache.writeQuery({
          query: GET_COMMENTS, variables: {url},
          data: { comments: [createComment].concat(comments) }
        });
      }}
      onCompleted={() => {
        const height = document.getElementById("commentable-widget").offsetHeight;
        window.parent.postMessage({"x-commentable-message-height": height}, url);
      }}>
      {(createComment, { data }) => (
        <div className="add-comment">
          <form onSubmit={e => {
              e.preventDefault();
              createComment({ variables: { content: input.value, url } });
              input.value = "";
            }}>
            <input ref={node => {input = node}} />
            <button type="submit">Add Comment</button>
          </form>
        </div>
      )}
    </Mutation>
  );
};

const CommentableWidget = () => (
  <ApolloProvider client={client}>
    <Comments />
  </ApolloProvider>
);

export default CommentableWidget;

const GET_COMMENTS = gql`
  query comments($url: String!) {
    comments(url: $url) {
      id
      content
    }
  }
`;

const CREATE_COMMENT = gql`
  mutation createComment($content: String!, $url: String!) {
    createComment(content: $content, url: $url) {
      id
      content
    }
  }
`;
