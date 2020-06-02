# Require the azure storage blob rubygem
require 'azure/storage/blob'
require 'mini_magick'


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
    # max width: 180px
    # max height: 196px
    if image.width >=3600
        image.thumbnail '5%'
    elsif image.width >= 1800
        image.thumbnail '10%'
    elsif image.width >= 1200
        image.thumbnail '15%'
    elsif image.width >= 900
        image.thumbnail '20%'
    elsif image.width >= 720
        image.thumbnail '25%'
    elsif image.width >= 515
        image.thumbnail '35%'
    elsif image.width >= 300
        image.thumbnail '60%'
    elsif image.width >= 200
        image.thumbnail '90%'
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
    client.delete_blob("images", name)
end

# upload('public/img/linda.jpg')