class Message < ApplicationRecord
    mount_uploader :file, FileUploader
    has_one_attached :file
    has_and_belongs_to_many :users, join_table: :users_messages

    def as_json(options = {})
        super(options).merge(file_url: file.url)
    end
end
