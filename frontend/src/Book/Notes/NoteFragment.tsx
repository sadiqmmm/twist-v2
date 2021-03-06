import gql from "graphql-tag";

export default gql`
  fragment note on Note {
    id
    number
    text
    createdAt
    state
    user {
      id
      email
      name
    }

    comments {
      id
      text
      createdAt
      user {
        id
        email
        name
      }
    }
  }
`;
