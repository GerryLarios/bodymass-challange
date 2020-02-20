class User < ApplicationRecord
  has_secure_password
  belongs_to :category, optional: true
  validates_presence_of :email
  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates_numericality_of :height, greater_than: 0.0, less_than: 5.0, on: :update
  validates_numericality_of :weight, greater_than: 0.0, less_than: 500.0, on: :update
  before_update :calculate_bmi
  
  private

  def calculate_bmi
    self.bmi = self.weight / (self.height ** 2)
    self.category_id = get_category_id 
  end

  def get_category_id
    Category.where("min <= ? AND max >= ?", self.bmi, self.bmi).ids.first
  end
end
