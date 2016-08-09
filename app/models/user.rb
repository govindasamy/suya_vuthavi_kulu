class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :account, :as => :accountable
  has_many :groups_users
  has_many :roles_users
  has_and_belongs_to_many :groups
  has_and_belongs_to_many :roles
  mount_uploader :profile_image, UserUploader
  after_create :create_account
  
  def create_account
    Account.make_account(self)

    ##assign user to normal role by default
    role = Role.find_or_create_by_name("Normal")
    roles_user = RolesUser.new(:role_id => role.id, :user_id => self.id)  
    roles_user.save
  end

  def full_name
    first_name + " " + last_name
  end  

  def monthly_decision_book(tran_date, group_obj)
    self.account.monthly_decision_book(tran_date, group_obj.account.id)
  end

  def monthly_decision_book_debit(tran_date, group_obj)
    self.account.monthly_decision_book_debit(tran_date, group_obj.account.id)
  end

  def last_month_outstanding_Principal(date, group_obj)
    self.account.last_month_outstanding_Principal(date, group_obj.account.id)
  end  

  def get_current_month_interest(date, group_obj)
    pa = last_month_outstanding_Principal(date, group_obj)
    get_interest(pa)
  end

  def get_balance_interest(date, group_obj)
    intr = get_current_month_interest(date, group_obj)
    intr - monthly_decision_book(date, group_obj)["interest_credit"].to_f
  end

  def get_balance_saving(date, group_obj)
    group_obj.saving_amount - monthly_decision_book(date, group_obj)["saving"]
  end   
  
  def get_balance_due(date, group_obj)
    group_obj.due_amount - monthly_decision_book(date, group_obj)["due"]
  end

  def role_names
    roles.collect(&:name)
  end  

  ####Total colelction report
  def total_collection(group_obj)
    AccountTranDetail.where(:from_account_id => account.id, :to_account_id => group_obj.account.id).select("sum(saving + interest_credit + other_amount) as amount").last.amount.to_f
  end  

end
