"""Exceptions for the /posts endpoint."""

class CreatePostException(Exception):
    """Raised when something unexpected happens during post creation.

    This should be treated as a server-side error.
    """

class GetPostQueryException(Exception):
    """Raised when something unpexpcted happens when fetching a list of posts.
    
    This should be treated as a server-side error.
    """

class GetPostException(Exception):
    """Raised when something unexpected happens when fetching post data.

    This should be treated as a server-side error.
    """

class UnknownPostIdException(GetPostException):
    """Raised when a post with a given ID does not exist.

    This should be treated as a client error.
    """

class DeletePostException(Exception):
    """Raised when something unexpected happens during post deletion.

    This should be treated as a server-side error.

    """