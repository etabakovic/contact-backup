class Office < Homepage
  
  def username
    @browser.text_field(id:'cred_userid_inputtext')
  end

  def password
    @browser.text_field(id:'cred_password_inputtext')
  end

  def sign_in
    @browser.button(id:'cred_sign_in_button')
  end

  def main_title
    @browser.link(id:'O365_MainLink_Logo')
  end

  def app_title
    @browser.link(class:'o365cs-nav-appTitle o365cs-topnavText o365button')
  end

  def nav_menu
    @browser.button(id:'O365_MainLink_NavMenu')
  end

  def people
    @browser.link(id:'O365_AppTile_People')
  end

  def your_contacts
    @browser.div(class:'_ph_5 _ph_8 _ph_e').span(class:'_ph_h').button
  end

  def other_contacts
    @browser.span(text:'Other contacts')
  end

  def restored_contacts(name)
    @browser.span(text:name)
  end

  def select_contact(name)
    #@browser.div(:xpath,"//div[@aria-label[contains(text(),'#{name}')]]/div[@class='_ph_z3 _ph_w3']//span/div[@class='_pe_d _pe_r _pe_R1']")
    @browser.div(:xpath,"//div[@class='_ph_03'][div//span[contains(text(),'#{name}')]]")
  end

  def contact_name
    @browser.div(class:'_pe_G _pe_w1 _pe_X').span(index:0)
  end

  #this method works only for phone and address contact details. 
  #label can be Phone or Address
  #type can be Business, Home, Mobile and Other for Phone and Business, Home and Other for Address
  def text_details(title,label)
    @browser.span(:xpath,"//div[div/span/span[text()='#{title}']]/div[@class='_rpc_y1']//div[span[contains(text(),'#{label}')]]/span[@class='ms-font-s']/span")
  end

  def address_details(type)
    @browser.div(:xpath,"//div[div/span/span[text()='Address']]/div[@class='_rpc_y1']//div[span[contains(text(),'#{type}')]]/a/div")
  end

  def link_details(title,label)
    @browser.span(:xpath,"//div[div/span/span[text()='#{title}']]/div[@class='_rpc_y1']//div[span[contains(text(),'#{label}')]]/a/span")
  end

  def no_label_details(title)
    @browser.span(:xpath,"//div[div/span/span[text()='#{title}']]/div[@class='_rpc_y1']//div[@class='_rpc_r1 _rpc_q1']/span[@class='ms-font-s']/span")
  end

end