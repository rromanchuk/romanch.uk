import * as statement from 'iam-floyd';

const policy = {
  Version: '2012-10-17',
  Statement: [
    
    new statement.S3()
      .allow()
      .allListActions()
      .compact()
      .toPutObject()
      .onBucket('ryanromanchuk-www')
      .onObject('ryanromanchuk-www', 'assets/*')
      .toJSON(),
    
  ],
};

var str = JSON.stringify(policy, null, 4);
console.log(str);


// tsc iam.ts && node iam.js > conf/iam.json && rm iam.js