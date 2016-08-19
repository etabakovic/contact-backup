class Cloudfinder < Homepage

  def username
    @browser.div(class_name:'login').text_field(id:'username')
  end

  def password
    @browser.div(class_name:'login').text_field(id:'password')
  end

  def login
    @browser.div(class_name:'login').button(value:'Login')
  end

  def search_header
    @browser.text_field(placeholder:'Search here...')
  end

  def contact(name)
    @browser.td(:xpath,"//div[@class='scrollme-list ng-scope']//table//tr[td[3]/strong='#{name}']/td[3]")
  end

  def contact_name(name)
    @browser.strong(:xpath, "//div[@class='scrollme-list ng-scope']//table//tr[td[3]/strong='#{name}']/td[3]/strong")
  end

  # def contact_name1(email)
  #   @browser.tr(:xpath, "//table//tr[td/small/span[contains(text(),'#{email}')]]")
  # end

  def contact_checkbox(name)
    @browser.checkbox(:xpath,"//div[@class='scrollme-list ng-scope']//table//tr[td[3]/strong='#{name}']/td[1]/input")
  end

  def view_file
    #actions.moveToElement(@browser.div(class:'view-permission').button)
    @browser.div(class:'view-permission').button(value: 'View file')
  end

  def restore
    @browser.button(text: 'Restore')
  end

  def backup_list
    @browser.button(class:'dropdown-toggle btn btn-default btn-xs ng-binding')
  end

  def select_backup(name)
    @browser.link(text:name)
  end

  def sort_by
    @browser.button(text:/Relevance/)
  end

  def relevance(name)
    @browser.link(text:name)
  end

  def name_main
    @browser.element(:xpath,"//div[@class='detail-main ng-scope']/*/*[2]")
  end

  def name_hidden_main
    @browser.element(:xpath,"//div[@class='detail-main ng-scope']/*/*[4]")
  end

  def email_main
    @browser.element(:xpath,"//div[@class='detail-main ng-scope']/*/*[6]")
  end

  def address(type)
    label = type.upcase
    @browser.element(:xpath,"//*[@ng-repeat='address in content.addresses']/*[*[text()='#{label}']]/*[@ng-repeat='value in address.values']")
  end

  def email(type)
    label = type.upcase
    @browser.element(:xpath,"//*[@ng-repeat='email in content.emails']/*[*[text()='#{label}']]/*[@ng-repeat='value in email.values']")
  end

  def phone(type)
    label = type.upcase
    @browser.element(:xpath,"//*[@ng-repeat='phone in content.phones']/*[*[text()='#{label}']]/*[@ng-repeat='value in phone.values']")
  end

  def restore_to_user
    @browser.link(:xpath,"//div[@class='modal-body']//div[@ng-switch-when='office365']//a[@class='select2-choice select2-default']")
  end

  def specify_user
    @browser.body(class:'modal-open').div(id:'select2-drop').div(class:'select2-search').text_field(class:'select2-input select2-focused')
  end

  def user_match(user)
    @browser.body(class:'modal-open').div(id:'select2-drop').div(class:'select2-result-label').span(text:user)
  end

  def restore_name
    @browser.body(class:'modal-open').text_field(class:'form-control ng-pristine ng-valid ng-valid-required')
  end

  def proceed
    @browser.div(class:'modal-footer').button(text:'Proceed')
  end

  def cancel
    @browser.div(class:'modal-footer').button(text:'Cancel')
  end

  def reports
    @browser.link(text:/Reports/)
  end

  def restore_reports
    @browser.div(class:'main-view ng-scope').link(text:'Restore')
  end

  def restore_modal
    @browser.div(class:'modal-footer').button(text:'Restore')
  end

  def restoring_modal
    @browser.div(class:'modal-footer').button(text:'Restoring...')
  end

  def close_modal
    @browser.div(class:'modal-footer').button(text:'Close')
  end

  def status_check(row)
    @browser.span(:xpath,"//table/tbody/tr[#{row}]/td[6]//span")
  end
end