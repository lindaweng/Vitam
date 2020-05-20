# Require the azure storage blob rubygem
require 'azure/storage/blob'

# Setup a specific instance of an Azure::Storage::Blob::BlobService
client = Azure::Storage::Blob::BlobService.create(storage_account_name: "hdrive92206144153", storage_access_key: "zc/zM7OoV1X1bd2/RPQ2Za4rUuQdq7OXL7qR9H+4u2CIeHaLA7ddvZtH3UNZGwc1LqWu5NFXCekxluhB3JSolg==")

# Create a container
name = "images"
container = client.get_container_acl('images')

# BlobServiceClient blobServiceClient = new BlobServiceClient("DefaultEndpointsProtocol=https;AccountName=hdrive92206144153;AccountKey=zc/zM7OoV1X1bd2/RPQ2Za4rUuQdq7OXL7qR9H+4u2CIeHaLA7ddvZtH3UNZGwc1LqWu5NFXCekxluhB3JSolg==");

# # //get a BlobContainerClient
# container = blobServiceClient.GetBlobContainerClient("images");

# Upload a Blob
# fileName = "maxwell.jpg"
# content = ::File.open('public/img/maxwell.jpg', 'rb') { |file| file.read }
# client.create_block_blob(name, fileName, content)

# List containers
# puts client.list_containers()

# List Blobs
# puts client.list_blobs(name)

# Download a Blob
# blob, content = client.get_blob(name, 'image-blob')
# ::File.open('download.png', 'wb') {|f| f.write(content)}

# Delete a Blob
# client.delete_blob(name, 'image-blob')

# Delete container
# client.delete_container(name)


def upload(tempfile)
    client = Azure::Storage::Blob::BlobService.create(storage_account_name: "hdrive92206144153", storage_access_key: "zc/zM7OoV1X1bd2/RPQ2Za4rUuQdq7OXL7qR9H+4u2CIeHaLA7ddvZtH3UNZGwc1LqWu5NFXCekxluhB3JSolg==")
    container = client.get_container_acl('images')
    fileName = tempfile.split("/")
    fileName = fileName[-1]
    content = ::File.open(tempfile, 'rb') { |file| file.read }
    client.create_block_blob('images', fileName, content)
    url = "https://hdrive92206144153.blob.core.windows.net/images/" + fileName
    return url
end



