class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable
         def role?(role)
      return !!self.roles.find_by_name(role.to_s.camelize)
  end
  mount_uploader :image, AttachmentUploader
end
