# Apache Nutch, Elasticsearch, MongoDB
This repo contains 1) a Dockerfile build for Apache Nutch and 2) a docker-compose Setup for the usage with Elasticsearch and MongoDB.

Info: Currently MongoDB is not attached and used.

## Apache Nutch Docker Build
The [Dockerfile](./nutch/Dockerfile) provides a Docker Build of Apache Nutch published as [smartive/nutch](https://hub.docker.com/r/smartive/nutch/).
There are two published builds:
- `latest` contains [Apache Nutch v1.13](https://github.com/apache/nutch/tree/release-1.13) for Elasticsearch 2.3.*
- `es-5` contains a [modified version of Apache Nutch v1.13](https://github.com/smartive/nutch/tree/feature/es-5) ready for Elasticsearch 5.4.*

## Apache Nutch docker-compose Setup for Elasticsearch 2.3.* and 5.4.* and MongoDB

[This repo nutch-elasticsearch-mongodb](https://github.com/smartive/docker-nutch-elasticsearch-mongodb) contains a [docker-compose](https://github.com/smartive/docker-nutch-elasticsearch-mongodb/blob/master/docker-compose.yml) configuration for Apache Nutch with Elasticsearch 2.3.* / 5.4.* and MongoDB.

To get started checkout the [Repo](https://github.com/smartive/docker-nutch-elasticsearch-mongodb) and run:
 
```bash
git clone git@github.com:smartive/docker-nutch-elasticsearch-mongodb.git
cd ./docker-nutch-elasticsearch-mongodb && docker-compose up
```

This will fire up the nutchserver and webapp. Visit [http://localhost:8080/](http://localhost:8080/).

### Manual Run 

```bash
docker-compose run -p 8080:8080 -p 8081:8081 --name=manual_nutch --rm --entrypoint=bash nutch
```

Then inside the docker box create the seed file:
```
echo "https://smartive.ch/" > seed.txt
```

Then open `regex-urlfilter.txt` and replace the last line to limit the crawl to the domain `smartive.ch`:
```bash
vi nutch/conf/regex-urlfilter.txt
# Inside regex-urlfilter.txt replace the last line `+.` with:
+^https://smartive\.ch
```

Then start the crawl
```bash
nutch/bin/crawl -i -s seed.txt crawldata 2
```

ES index only from existing crawl database:
```
/root/nutch/bin/nutch index crawldata/crawldb -linkdb crawldata/linkdb crawldata/segments/20170706210640
```

# Credits
This Dockerfile and docker-compose Setup is partly based on [tpickett/mongo-elasticsearch-nutch](https://github.com/tpickett/mongo-elasticsearch-nutch).

[Apache Nutch](http://nutch.apache.org/) is a highly extensible and scalable open source web crawler software project. A well matured, production ready crawler.

