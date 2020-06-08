# Require the azure storage blob rubygem
require 'azure/storage/blob'
require 'mini_magick'
require 'dotenv/load'

# Setup a specific instance of an Azure::Storage::Blob::BlobService
# client = Azure::Storage::Blob::BlobService.create(storage_account_name: "hdrive92206144153", storage_access_key: "zc/zM7OoV1X1bd2/RPQ2Za4rUuQdq7OXL7qR9H+4u2CIeHaLA7ddvZtH3UNZGwc1LqWu5NFXCekxluhB3JSolg==")

# Create a container
# name = "images"
# container = client.get_container_acl('images')

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
    client = Azure::Storage::Blob::BlobService.create(storage_account_name: "hdrive92206144153", storage_access_key: ENV['HDRIVE_AZURE_PRIMARY_KEY'])
    container = client.get_container_acl('images')
    image = MiniMagick::Image.open(tempfile)
    # puts image.path #=> "tempfile"
    # max width: 320px
    # max height: 196px
    if image.width >=6400
        image.thumbnail '5%'
    elsif image.width >= 4570
        image.thumbnail '7%'
    elsif image.width >= 3200
        image.thumbnail '10%'
    elsif image.width >= 2140
        image.thumbnail '15%'
    elsif image.width >= 1600
        image.thumbnail '20%'
    elsif image.width >= 1280
        image.thumbnail '25%'
    elsif image.width >= 915
        image.thumbnail '35%'
    elsif image.width >= 640
        image.thumbnail '50%'
    elsif image.width >= 400
        image.thumbnail '80%'
    end
    image.write "public/img/output.png"
    # image.resize "100x100"
    fileName = tempfile.split("/")
    fileName = fileName[-1]
    content = ::File.open("public/img/output.png", 'rb') { |file| file.read }
    client.create_block_blob('images', fileName, content)
    url = "https://hdrive92206144153.blob.core.windows.net/images/" + fileName
    return url
end


def delete(url)
    client = Azure::Storage::Blob::BlobService.create(storage_account_name: "hdrive92206144153", storage_access_key: "zc/zM7OoV1X1bd2/RPQ2Za4rUuQdq7OXL7qR9H+4u2CIeHaLA7ddvZtH3UNZGwc1LqWu5NFXCekxluhB3JSolg==")
    container = client.get_container_acl('images')
    name = url.split("/")
    name = name[-1]
    puts name
    # Need to add something to check if the blob exists
    client.delete_blob("images", name)
end

# upload('public/img/linda.jpg')