# Require the azure storage blob rubygem
require 'azure/storage/blob'
require 'mini_magick'
require 'dotenv/load'

# Setup a specific instance of an Azure::Storage::Blob::BlobService

# Create a container
# name = "images"
# container = client.get_container_acl('images')

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
    client = Azure::Storage::Blob::BlobService.create(storage_account_name: "hdrive92206144153", storage_access_key: ENV['HDRIVE_AZURE_PRIMARY_KEY'])
    container = client.get_container_acl('images')
    name = url.split("/")
    name = name[-1]
    puts name
    # check if the blob exists
    blobs = client.list_blobs('images')
    exists = false
    for i in blobs
        if i.name == name
            exists = true
        end
    end
    puts exists
    if exists
        client.delete_blob("images", name)
    end
end

# delete('https://hdrive92206144153.blob.core.windows.net/images/linda.jpg')