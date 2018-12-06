import React from "react";
import { ApolloProvider } from "react-apollo";
import { Query } from "react-apollo";
import gql from "graphql-tag";
import queryString from 'query-string';

import client from "../client";

const Comments = () => (
  <Query query={ THREAD_QUERY } variables={{ url: queryString.parse(window.location.search).url }}>
    {({ loading, error, data }) => {
      if (loading) return <p>Loading...</p>;
      if (error) return <p>Error :(</p>;

      return (
        <div>
          <h2>{data.thread.comments.length} comment(s):</h2>
          { data.thread.comments.map(({ id, url }) => (
            <div key={id} className="comment">{url}</div>
          ))}
        </div>
      )
    }}
  </Query>
);

const CommentableWidget = () => (
  <ApolloProvider client={client}>
    <Comments />
  </ApolloProvider>
);

export default CommentableWidget;

const THREAD_QUERY = gql`
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
