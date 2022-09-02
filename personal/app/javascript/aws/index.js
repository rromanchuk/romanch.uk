import { S3Client, PutObjectCommand } from 'https://cdn.jsdelivr.net/npm/@aws-sdk/client-s3/+esm'

// try {
//   const data = await s3.send(new PutObjectCommand(uploadParams));
//   alert("Successfully uploaded photo.");
//   viewAlbum(albumName);
// } catch (err) {
//   return alert("There was an error uploading your photo: ", err.message);
// }

const bareBonesS3 = new S3Client({});
// await bareBonesS3.send(new GetObjectCommand({}));

const uploadFile = async (file) => {
  const params = { Bucket: 'pireps', Key: 'test', file: file };
  const data = await bareBonesS3.send(new PutObjectCommand(params));
}

export { bareBonesS3, uploadFile }