import React from "react";
import { ApolloProvider } from "react-apollo";
import { Query, Mutation } from "react-apollo";
import gql from "graphql-tag";
import queryString from 'query-string';

import client from "../client";

const Comments = () => (
  <div className="comments">
    <Query query={GET_THREAD} variables={{ url: queryString.parse(window.location.search).url }}>
      {({ loading, error, data }) => {
        if (loading) return <p>Loading...</p>;
        if (error) return <p>Error :(</p>;

        return (
          <div className="comments-list">
            <AddComment thread={data.thread} />

            <h2>{data.thread.comments.length} comment(s):</h2>
            { data.thread.comments.map(({ id, content }) => (
              <div key={id} className="comment">{content}</div>
            ))}
          </div>
        )
      }}
    </Query>
  </div>
);

const AddComment = ({thread}) => {
  let input;

  return (
    <Mutation mutation={CREATE_COMMENT}
      update={(cache, { data: { createComment } }) => {
        const { thread: { comments } } = cache.readQuery({ query: GET_THREAD, variables: { url: thread.url } });
        cache.writeQuery({
          query: GET_THREAD,
          data: { thread: { ...thread, comments: [createComment].concat(comments) } }
        });
      }}
      onCompleted={() => {
        const height = document.getElementById("commentable-widget").offsetHeight;
        window.parent.postMessage({height: height}, thread.url);
      }}>
      {(createComment, { data }) => (
        <div className="add-comment">
          <form onSubmit={e => {
              e.preventDefault();
              createComment({ variables: { content: input.value, threadId: parseInt(thread.id) } });
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

const GET_THREAD = gql`
  query thread($url: String!) {
    thread(url: $url) {
      id
      url
      comments {
        id
        content
      }
    }
  }
`;

const CREATE_COMMENT = gql`
  mutation createComment($content: String!, $threadId: Int!) {
    createComment(content: $content, thread_id: $threadId) {
      id
      content
    }
  }
`;
