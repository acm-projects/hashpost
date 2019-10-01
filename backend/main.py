import json
from flask import Request, Response


def posts(request: Request) -> Response:
    """Return data related to posts.

    This endpoint supports GET requests and POST requests. A HTTP GET request
    to this endpoint will return all given posts that match the parameters given.

    Args:
        request (flask.Request): The request object.
        <http://flask.pocoo.org/docs/1.0/api/#flask.Request>
    Returns:
        The response text, or any set of values that can be turned into a
        Response object using `make_response`
        <http://flask.pocoo.org/docs/1.0/api/#flask.Flask.make_response>.

    """
    # TODO(posts): Handle request
    posts = []
    posts_json = json.dumps(posts)
    response = Response(posts_json, content_type='application/json; charset=utf-8')
    response.headers.add('content-length', len(posts_json))
    return response


def auth(request: Request) -> Response:
    """Handle authentication requests.

    This endpoint supports GET requests and POST requests.

    Args:
        request (flask.Request): The request object.
        <http://flask.pocoo.org/docs/1.0/api/#flask.Request>
    Returns:
        The response text, or any set of values that can be turned into a
        Response object using `make_response`
        <http://flask.pocoo.org/docs/1.0/api/#flask.Flask.make_response>.

    """
    # TODO: Handle request
    return Response('OK', status=200)
