describe "Test", :broken => false do

  full_path = File.dirname(File.dirname(__FILE__)) + '/lib/data/contact.yaml'
  contacts = YAML::load(File.open(full_path))
  original = contacts["contact1"]
  restore_name = ''

#=begin
  context "Search contact" do

    include_context "Cloudfinder login"

    it "enter and search contact name" do
      @browser.send_keys :f11
      @homepage.wait_present(@homepage.goto_cloudfinder.search_header)
      @homepage.goto_cloudfinder.search_header.set contacts['contact1']['full_name']
      @homepage.goto_cloudfinder.search_header.send_keys :return
    end

    it "sorts filtered contacts by backup date" do
      @homepage.wait_present(@homepage.goto_cloudfinder.contact_name(contacts["contact1"]["full_name"]))
      @homepage.wait_present(@homepage.goto_cloudfinder.sort_by)
      @homepage.goto_cloudfinder.sort_by.click
      @homepage.wait_present(@homepage.goto_cloudfinder.relevance('Backup date'))
      @homepage.goto_cloudfinder.relevance('Backup date').click
    end

#=begin
    it "opens latest backup" do
      @homepage.wait_present(@homepage.goto_cloudfinder.contact_name(contacts['contact1']['full_name']))
      puts @homepage.goto_cloudfinder.contact_name(contacts['contact1']['full_name']).text
      @homepage.goto_cloudfinder.contact_name(contacts['contact1']['full_name']).click
    end

    it "selects #{contacts['contact1']['backup_date']} backup date from list" do
      @homepage.wait_present(@homepage.goto_cloudfinder.backup_list)
      @homepage.goto_cloudfinder.backup_list.click
      @homepage.goto_cloudfinder.select_backup(contacts['contact1']['backup_date']).click
    end

    it "checks backup contact data in header" do
      @homepage.wait_present(@homepage.goto_cloudfinder.name_main)
      puts @homepage.goto_cloudfinder.name_main.text
      puts @homepage.goto_cloudfinder.name_hidden_main.text
      puts @homepage.goto_cloudfinder.email_main.text
    end

    it "opens view file for backup contact details" do
      @browser.scroll.to :center
      @homepage.wait_present(@homepage.goto_cloudfinder.view_file)
      @homepage.goto_cloudfinder.view_file.click
    end

    it "checks backup contact details" do
      @browser.scroll.to :top
      @homepage.wait_present(@homepage.goto_cloudfinder.address('work'))
      #state is missing in backup
      puts @homepage.goto_cloudfinder.address('work').text
      puts @homepage.goto_cloudfinder.email('work').text
      puts @homepage.goto_cloudfinder.phone('work').text
    end
      #puts contacts.length
      #puts contacts['email']

    it "verifies backup address" do
      @homepage.wait_present(@homepage.goto_cloudfinder.address('work'))
      address = original['address'].to_s + ' ' + original['postal'].to_s + ' ' + original['city'].to_s + ' ' + original['country'].to_s
      full_address = address.gsub(/\s{1,}/,' ')
      expect(@homepage.goto_cloudfinder.address('work').text).to eql(full_address)
    end

    it "verifies backup email does not exist" do
      expect(@homepage.goto_cloudfinder.email('work').text).to eql(contacts['contact1']['email'])
      #expect(@homepage.goto_cloudfinder.email('work')).not_to be_present
    end

    it "verifies original backup phone" do
      expect(@homepage.goto_cloudfinder.phone('work').text).to eql(original['phone'])
    end

    it "click on restore" do
      @homepage.goto_cloudfinder.restore.click
    end

    it "specify user" do
      @homepage.wait_present(@homepage.goto_cloudfinder.restore_to_user)
      @homepage.goto_cloudfinder.restore_to_user.click
      @homepage.wait_present(@homepage.goto_cloudfinder.specify_user)
      @homepage.goto_cloudfinder.specify_user.set original['user']
      @homepage.wait_present(@homepage.goto_cloudfinder.user_match(original['user']))
      @homepage.goto_cloudfinder.user_match(original['user']).click
    end

    it "specify location" do
      restore_name = 'Restore' + Time.now.to_i.to_s
      @homepage.wait_present(@homepage.goto_cloudfinder.restore_name)
      @homepage.goto_cloudfinder.restore_name.set restore_name
    end

    it "initiates restore" do
      @homepage.goto_cloudfinder.proceed.click
      @homepage.wait_present(@homepage.goto_cloudfinder.restore_modal)
      @homepage.goto_cloudfinder.restore_modal.click
    end

    it "waits for restore to start" do
      @homepage.wait_present(@homepage.goto_cloudfinder.restoring_modal)
      @homepage.goto_cloudfinder.restoring_modal.click
    end

    it "closes modal" do
      @homepage.wait_present(@homepage.goto_cloudfinder.close_modal)
      @homepage.goto_cloudfinder.close_modal.click
    end

    it "opens reports page" do
      @homepage.wait_present(@homepage.goto_cloudfinder.reports)
      @homepage.goto_cloudfinder.reports.click
    end

    it "opens restore tab" do
      @homepage.wait_present(@homepage.goto_cloudfinder.restore_reports)
      @homepage.goto_cloudfinder.restore_reports.click
      @browser.refresh
    end

    it "waits for restore to complete" do
      @homepage.wait_present(@homepage.goto_cloudfinder.status_check(1))
      @homepage.wait_status(@homepage.goto_cloudfinder.status_check(1),'Completed')
    end
#=end
  end
#=end

#=begin
  context "Verify restored contact details on office 365" do
    it "opens office365 login page" do
      @browser.goto($config['office']['host'])
    end
#  end

  include_context "Office login"

  #context "Goes to people" do

    it "checks page title" do
      @homepage.wait_present(@homepage.goto_office.main_title)
      expect(@homepage.goto_office.main_title.text).to eql('Office 365')
    end

    it "opens main menu" do
      @homepage.wait_present(@homepage.goto_office.nav_menu)
      @homepage.goto_office.nav_menu.click
    end

    it "opens people" do
      @homepage.wait_present(@homepage.goto_office.people)
      @homepage.goto_office.people.click
    end

    it "opens your contacts" do
      @homepage.wait_present(@homepage.goto_office.your_contacts)
      @homepage.goto_office.your_contacts.click
    end

    it "opens other contacts" do
      @homepage.wait_present(@homepage.goto_office.other_contacts)
      @homepage.goto_office.other_contacts.click
    end

    it "opens restore contacts" do
      @homepage.wait_present(@homepage.goto_office.restored_contacts(restore_name))
      @homepage.goto_office.restored_contacts(restore_name).click
      #sleep 10
    end

    it "open contact details" do
      @homepage.wait_present(@homepage.goto_office.select_contact(contacts['contact1']['full_name']))
      @homepage.goto_office.select_contact(contacts['contact1']['full_name']).click
      sleep 5
    end

    it "checks restored contact details" do
      #title is missing in restired contact
      puts @homepage.goto_office.contact_name.text
      puts @homepage.goto_office.text_details('Work','Job title').text
      puts @homepage.goto_office.text_details('Work','Department').text
      puts @homepage.goto_office.text_details('Work','Company').text
      puts @homepage.goto_office.link_details('Send email','Email').text
      puts @homepage.goto_office.text_details('Phone','Business').text
      #puts @homepage.goto_office.text_details('Phone','Home').text
      puts @homepage.goto_office.address_details('Business').text
      #puts @homepage.goto_office.text_details('Other','School').text
      puts @homepage.goto_office.link_details('Other','Web page').text
      puts @homepage.goto_office.no_label_details('IM').text
    end

  end
#=end
end