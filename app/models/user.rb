class User < ApplicationRecord
  validates_presence_of :email
  has_secure_password
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  belongs_to :category, optional: true
  before_update :calculate_bmi
  
  private

  def calculate_bmi
    self.bmi = self.weight / (self.height) ** 2
    self.category_id = get_category_id 
  end

  def get_category_id
    Category.where("min <= ? AND max >= ?", self.bmi, self.bmi).ids.first
  end
end
