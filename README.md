partly based on https://github.com/tpickett/mongo-elasticsearch-nutch

```
docker-compose run nutch bash
docker-compose run -p 8080:8080 -p 8081:8081 nutch bash
```

```
nutch/bin/nutch webapp &
nutch/bin/nutch startserver &
```

-> open http://localhost:8080

oder

```
echo "https://smartive.ch/" > seed.txt
nutch/bin/crawl -i seed.txt crawldata 2
```

ES index only from existing crawl database:
```
/root/nutch/bin/nutch index crawldata/crawldb -linkdb crawldata/linkdb crawldata/segments/20170706210640
```

[Apache Nutch](http://nutch.apache.org/) is a highly extensible and scalable open source web crawler software project. A well matured, production ready crawler.

