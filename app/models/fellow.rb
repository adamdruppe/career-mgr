require 'digest/md5'

class Fellow < ApplicationRecord
  has_one :contact, as: :contactable
  accepts_nested_attributes_for :contact
  
  has_many :cohort_fellows
  has_many :cohorts, through: :cohort_fellows
  
  has_and_belongs_to_many :interests
  has_and_belongs_to_many :industries
  
  belongs_to :employment_status
  
  validates :first_name, :last_name, :employment_status_id, presence: true
  
  validates :graduation_semester, inclusion: {in: Course::VALID_SEMESTERS}
  validates :graduation_year, numericality: {greater_than: 2010, less_than: 2050, allow_nil: true, only_integer: true}
  validates :graduation_fiscal_year, numericality: {greater_than: 2010, less_than: 2050, allow_nil: true, only_integer: true}
  
  validates :gpa, numericality: {greater_than_or_equal_to: 0.0, less_than_or_equal_to: 4.0, allow_nil: true}
  validates :efficacy_score, numericality: {greater_than_or_equal_to: 0.0, less_than_or_equal_to: 1.0, allow_nil: true}
  
  before_create :generate_key
  
  def cohort
    cohorts.order('id desc').first
  end
  
  def full_name
    [first_name, last_name].join(' ').strip
  end
  
  def graduation
    [graduation_semester, graduation_year].join(' ').strip
  end
  
  private
  
  def generate_key
    return unless key.nil?
    unique_count = self.class.where(first_name: first_name, last_name: last_name, graduation_year: graduation_year).count
    
    hash = Digest::MD5.hexdigest([first_name, last_name, graduation_year, unique_count].join('-'))[0,4]
    self.key = [first_name[0].upcase, last_name[0].upcase, (graduation_year % 100), hash].join('').upcase
  end
end
