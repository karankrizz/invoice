class Invoice < ApplicationRecord
  #associations
  belongs_to :user
  has_many :products, dependent: :destroy
  accepts_nested_attributes_for :products, reject_if: :all_blank, allow_destroy: true

  #validations
  validates :invoicing_date, presence: true
  validates :due_date, presence: true
  validates :terms_and_conditions, acceptance: true
  validates_presence_of :products

  #enum
  enum payment_mode: [:cash, :cheque, :draft]

  #pagination
  paginates_per 10

  #scopes
  scope :latest_created_at, ->{order(invoicing_date: :desc)}


end
