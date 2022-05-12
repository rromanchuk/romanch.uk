import * as statement from 'iam-floyd';

const policy = {
  Version: '2012-10-17',
  Statement: [
    new statement.Codedeploy()
      .allow()
      .allListActions()
      .allTaggingActions()
      .allReadActions()
      .compact()
      .toCreateDeployment()
      .toJSON(),
    new statement.Autoscaling()
      .allow()
      .toStartInstanceRefresh()
      .toJSON(),
    new statement.Ec2()
     .allow()
     .allReadActions()
     .allTaggingActions()
     .compact()
     .toCreateImage()
     .toCreateLaunchTemplateVersion()
     .toModifyLaunchTemplate()
     .toJSON(),
    new statement.S3()
      .allow()
      .toGetObject()
      .toPutObject()
      .onBucket('personal-www')
      .onObject('personal-www', 'assets/*')
      .onObject('personal-www', 'sitemap.xml')
      .onObject('personal-www', 'robots.txt')
      .toJSON(),
    new statement.CognitoIdp()
      .allow()
      .allListActions()
      .allReadActions()
      .compact()
      .onUserpool('us-east-1_mypool')
      .toJSON(),
    new statement.Elasticfilesystem()
      .allow()
      .toClientRootAccess()
      .onFileSystem('fs-mypool')
      .toJSON()
  ],
};

var str = JSON.stringify(policy, null, 4);
console.log(str);