const AWS = require('aws-sdk');
const { v4: uuidv4 } = require('uuid');

const dynamodb = new AWS.DynamoDB.DocumentClient();
const tableName = process.env.TABLE_NAME;

exports.handler = async (event) => {
  if (event.httpMethod === 'POST') {
    const body = JSON.parse(event.body);
    const shortId = uuidv4().slice(0, 8);

    await dynamodb.put({
      TableName: tableName,
      Item: { id: shortId, url: body.url }
    }).promise();

    return {
      statusCode: 200,
      body: JSON.stringify({ shortUrl: `${event.headers.Host}/${shortId}` })
    };
  }

  if (event.httpMethod === 'GET') {
    const id = event.pathParameters.id;

    const result = await dynamodb.get({
      TableName: tableName,
      Key: { id }
    }).promise();

    if (!result.Item) {
      return { statusCode: 404, body: 'Not found' };
    }

    return {
      statusCode: 302,
      headers: { Location: result.Item.url },
      body: ''
    };
  }

  return { statusCode: 400, body: 'Bad Request' };
};
