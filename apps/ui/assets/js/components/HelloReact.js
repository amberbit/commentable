import React from "react";
import { ApolloProvider } from "react-apollo";
import { Query } from "react-apollo";
import gql from "graphql-tag";

import client from "../client";

const Comments = () => (
  <Query query={COMMENTS_QUERY}>
    {({ loading, error, data }) => {
      if (loading) return <p>Loading...</p>;
      if (error) return <p>Error :(</p>;

      return data.comments.map(({ id, content }) => (
        <div key={id}>{content}</div>
      ));
    }}
  </Query>
);

const HelloReact = () => (
  <ApolloProvider client={client}>
    <h2>Comments:</h2>
    <Comments />
  </ApolloProvider>
);

export default HelloReact;

const COMMENTS_QUERY = gql`
  {
    comments {
      id
      content
    }
  }
`
