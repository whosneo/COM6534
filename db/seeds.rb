%w(ac4rab ac4jfwg).each do |username|
  account = Account.where(username: username).first_or_initialize
  account.get_info_from_ldap
  account.role = :staff
  account.save
end

%w(ac6gene).each do |username|
  account = Account.where(username: username).first_or_initialize
  account.get_info_from_ldap
  account.role = :student
  account.save
end