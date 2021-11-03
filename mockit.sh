curl -i -X POST -H 'Content-Type: application/json' http://localhost:2525/imposters --data '{
  "port": 4545,
  "protocol": "http",
  "stubs": [{
    "responses": [
      { "is": { "statusCode": 400 }}
    ],
    "predicates": [{
      "and": [
        {
          "equals": {
            "path": "/test",
            "method": "POST",
            "headers": { "Content-Type": "application/json" }
          }
        },
        {
          "not": {
            "contains": { "body": "requiredField" },
            "caseSensitive": true
          }
        }
      ]
    }]
  }]
}'
