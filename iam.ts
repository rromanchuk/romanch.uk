import * as statement from 'iam-floyd';

const policy = {
  Version: '2012-10-17',
  Statement: [
    
    new statement.S3()
      .allow()
      .allListActions()
      .compact()
      .onBucket('personal-www')
      .onObject('personal-www', '*')
      .toJSON(),
    new statement.S3()
      .allow()
      .toGetObject()
      .toPutObject()
      .onBucket('personal-www')
      .onObject('personal-www', 'assets/*')
      .toJSON(),
    new statement.CognitoIdp()
      .allow()
      .allListActions()
      .allReadActions()
      .compact()
      .onUserPool('us-east-1_Zqtg9pmNf')
      .toJSON(),
    
  ],
};

var str = JSON.stringify(policy, null, 4);
console.log(str);


// tsc iam.ts && node iam.js > conf/iam.json && rm iam.js