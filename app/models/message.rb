class Message < ApplicationRecord
    mount_uploader :file, FileUploader
    has_one_attached :file

    def as_json(options = {})
        super(options).merge(file_url: file.url)
    end
end
