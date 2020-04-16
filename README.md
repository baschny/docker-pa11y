docker-pa11y Dashboard in Docker
================================

Test the docker pa11y dashboard and webservice in a docker environment.

Requirements
------------
- Docker and the `docker-compose` tool
- Browser

How to use
----------
Simply start the containers (dashboard and mongo):

If you have `make` installed:
```
make run
```
else:
```
docker-compose up -d
```

Check the logs:
```
make logs
```
or:
```
docker-compose logs -f dashboard
```

Go to the browser:

http://localhost:4000/

See also
--------
- https://pa11y.org/
- https://github.com/pa11y/pa11y-dashboard
- https://github.com/pa11y/pa11y-webservice
