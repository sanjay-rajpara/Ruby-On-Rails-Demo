class Config < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
   mount_uploader :logo, AttachmentUploader # Tells rails to use this uploader for this model.
   validates :website_name, presence: true # Make sure the owner's name is present.
         
end
