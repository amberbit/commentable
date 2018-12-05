import React from "react";
import { ApolloProvider } from "react-apollo";
import { Query } from "react-apollo";
import gql from "graphql-tag";

import client from "../client";

const Comments = () => (
  <div className="comments">
    <h2>Comments:</h2>
    <Query query={THREADS_QUERY}>
      {({ loading, error, data }) => {
        if (loading) return <p>Loading...</p>;
        if (error) return <p>Error :(</p>;

        return data.threads.map(({ id, url }) => (
          <div key={id} className="comment">{url}</div>
        ));
      }}
    </Query>
  </div>
);

const CommentableWidget = () => (
  <ApolloProvider client={client}>
    <Comments />
  </ApolloProvider>
);

export default CommentableWidget;

const COMMENTS_QUERY = gql`
  {
    comments {
      id
      content
    }
  }
`

const THREADS_QUERY = gql`
  {
    threads {
      id
      url
      comments {
        id
        content
      }
    }
  }
`
