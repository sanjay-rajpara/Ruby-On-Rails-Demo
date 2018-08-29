class Team < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
   mount_uploader :image, AttachmentUploader # Tells rails to use this uploader for this model.
   validates :name, presence: true # Make sure the owner's name is present.
         
end
