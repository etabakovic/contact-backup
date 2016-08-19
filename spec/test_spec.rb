describe "Test", :broken => false do

  full_path = File.dirname(File.dirname(__FILE__)) + '/lib/data/contact.yaml'
  contacts = YAML::load(File.open(full_path))
  restore_name = ''
  restore_list = []

  header = ["full_name","name","email","title","updated","deleted"]
  details = ["address","email","phone"]
  type = ["work","home","mobile"]
  people = {  "Work" => ["Job title","Department","Company","Office","Manager","Assistant","Yomi company"],
              "Send email" => ["Email","Email 2","Email 3"],
              "Phone" => ["Work","Home","Mobile"],
              "Address" => ["Work","Home"],
              "IM" => [],
              "Other" => ["Nickname","Personal web page","Significant other","School","Hobbies","Location","Web page","Birthday","Anniversary"]}

#=begin
#contacts.keys.each do |c|
  context "Cloudfinder" do

    it "opens cloudfinder login page" do
      @browser.goto($config['cloudfinder']['host'])
    end

    include_context "Cloudfinder login"

    it "enter and search contact name" do
      @browser.send_keys :f11
      @homepage.wait_present(@homepage.goto_cloudfinder.search_header)
      @homepage.goto_cloudfinder.search_header.set contacts['contact1']['name']
      @homepage.goto_cloudfinder.search_header.send_keys :return
      @homepage.wait_present(@homepage.goto_cloudfinder.contact_name(contacts["contact1"]["name"]))
    end
    
    it "opens advanced search" do
      @homepage.wait_present(@homepage.goto_cloudfinder.advanced_search)
      @homepage.goto_cloudfinder.advanced_search.click
    end

    it "sets date" do
      #this is just made it work
      month = '08-'
      day = '15'
      year = '2016-'
      @homepage.wait_present(@homepage.goto_cloudfinder.date)
      @homepage.goto_cloudfinder.date.set year
      5.times do
        @homepage.goto_cloudfinder.date.send_keys :backspace
      end
      month.each_char do |m|
        @homepage.goto_cloudfinder.date.send_keys m
      end
      3.times do
        @homepage.goto_cloudfinder.date.send_keys :backspace
      end
      day.each_char do |d|
        @homepage.goto_cloudfinder.date.send_keys d
      end
      @homepage.goto_cloudfinder.date.send_keys :return
    end

#=begin
    it "sorts filtered contacts by backup date" do
      @homepage.wait_present(@homepage.goto_cloudfinder.sort_by)
      @homepage.goto_cloudfinder.sort_by.click
      @homepage.wait_present(@homepage.goto_cloudfinder.relevance('Backup date'))
      @homepage.goto_cloudfinder.relevance('Backup date').click
    end

    it "opens latest backup" do
      @homepage.wait_present(@homepage.goto_cloudfinder.contact_name(contacts['contact1']['name']))
      puts @homepage.goto_cloudfinder.contact_name(contacts['contact1']['name']).text
      @homepage.goto_cloudfinder.contact_name(contacts['contact1']['name']).click
    end

    it "selects #{contacts['contact1']['backup_date']} backup date from list" do
      @homepage.wait_present(@homepage.goto_cloudfinder.backup_list)
      @homepage.goto_cloudfinder.backup_list.click
      @homepage.goto_cloudfinder.select_backup(contacts['contact1']['backup_date']).click
    end

    header.each_with_index do |h,i|
      if !contacts["contact1"][h].to_s.empty?
        it "verifies backup #{h} in header is valid" do
          index = 2*(i+1)
          @homepage.wait_present(@homepage.goto_cloudfinder.contact_header(index))
          expect(@homepage.goto_cloudfinder.contact_header(index).text).to eql(contacts["contact1"][h])
        end
      else
        it "verifies backup #{h} in header is not present" do
          index = 2*(i+1)
          expect(@homepage.goto_cloudfinder.contact_header(index)).not_to be_present
        end
      end
    end

#=begin
    it "scrolls to center" do
      @browser.scroll.to :center
    end

    it "opens view file for backup contact details" do
      @homepage.wait_present(@homepage.goto_cloudfinder.view_file)
      @homepage.goto_cloudfinder.view_file.click
    end

    it "scrolls to top" do
      @browser.scroll.to :top
    end

    details.each do |d|
      type.each do |t|
        case d
        when "address"
          if !contacts['contact1']['address'][t].to_s.empty?
            it "verifies backup #{d} #{t} details is valid" do
              address = contacts['contact1']['address'][t]['street'].to_s + ' ' + contacts['contact1']['address'][t]['postal'].to_s + ' ' + contacts['contact1']['address'][t]['city'].to_s + ' ' + contacts['contact1']['address'][t]['country'].to_s
              full_address = address.gsub(/\s{1,}/,' ')
              expect(@homepage.goto_cloudfinder.address(t).text).to eql(full_address)
            end
          else
            it "verifies backup #{d} #{t} details do not exist" do
              expect(@homepage.goto_cloudfinder.address(t)).not_to be_present
            end
          end
        when "phone"
          if !contacts['contact1']['address'][t].to_s.empty?
            it "verifies backup #{d} #{t} details is valid" do
              expect(@homepage.goto_cloudfinder.phone(t).text).to eql(contacts['contact1']['phone'][t])
            end
          else
            it "verifies backup #{d} #{t} details do not exist" do
              expect(@homepage.goto_cloudfinder.phone(t)).not_to be_present
            end
          end
        when "email"
          case t
          when "work"
            if !contacts['contact1']['email'].to_s.empty?
              it "verifies backup #{d} details is valid" do
                expect(@homepage.goto_cloudfinder.email(t).text).to eql(contacts['contact1']['email'])
              end
            else
              it "verifies backup #{d} #{t} details do not exist" do
                expect(@homepage.goto_cloudfinder.email(t)).not_to be_present
              end
            end
          when "home"
            if !contacts['contact1']['email1'].to_s.empty?
              it "verifies backup #{d} details is valid" do
                expect(@homepage.goto_cloudfinder.email(t).text).to eql(contacts['contact1']['email1'])
              end
            else
              it "verifies backup #{d} #{t} details does not exist" do
                expect(@homepage.goto_cloudfinder.email(t)).not_to be_present
              end
            end
          when "mobile"
            if !contacts['contact1']['email2'].to_s.empty?
              it "verifies backup #{d} details is valid" do
                expect(@homepage.goto_cloudfinder.email(t).text).to eql(contacts['contact1']['email2'])
              end
            else
              it "verifies backup #{d} #{t} details does not exist" do
                expect(@homepage.goto_cloudfinder.email(t)).not_to be_present
              end
            end
          end
        end
      end
    end
#=begin
    it "click on restore" do
      @homepage.goto_cloudfinder.restore.click
    end

    it "specify user" do
      @homepage.wait_present(@homepage.goto_cloudfinder.restore_to_user)
      @homepage.goto_cloudfinder.restore_to_user.click
      @homepage.wait_present(@homepage.goto_cloudfinder.specify_user)
      @homepage.goto_cloudfinder.specify_user.set contacts['contact1']['user']
      @homepage.wait_present(@homepage.goto_cloudfinder.user_match(contacts['contact1']['user']))
      @homepage.goto_cloudfinder.user_match(contacts['contact1']['user']).click
    end

    it "specify location" do
      restore_name = 'Restore' + Time.now.to_i.to_s
      restore_list.push restore_name
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
#end
#=end

#=begin
  context "Office 365" do
    it "opens office365 login page" do
      @browser.goto($config['office']['host'])
    end

    include_context "Office login"

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
      #restore_name = 'Restore1471626628'
      @homepage.wait_present(@homepage.goto_office.restored_contacts(restore_name))
      @homepage.goto_office.restored_contacts(restore_name).click
    end

    it "open contact details" do
      @homepage.wait_present(@homepage.goto_office.select_contact(contacts['contact1']['name']))
      @homepage.goto_office.select_contact(contacts['contact1']['name']).click
      @homepage.wait_present(@homepage.goto_office.contact_name)
      puts @homepage.goto_office.contact_name.text
    end

    people.keys.each do |key|
      case key
      when "Work"
        people[key].each do |value|
          if !contacts['contact1'][value.downcase].to_s.empty?
            it "verifies #{key} #{value} details are valid" do
              expect(@homepage.goto_office.text_details(key,value).text).to eql(contacts['contact1'][value.downcase])
            end
          else
            it "verifies #{key} #{value} details do not exist" do
              expect(@homepage.goto_office.text_details(key,value)).not_to be_present
            end
          end
        end
      when "Phone"
        people[key].each do |value|
          if !contacts['contact1'][key.downcase][value.downcase].to_s.empty?
            it "verifies #{key} #{value} details are valid" do
              if value.eql?"Work"
                value1 = "Business"
              else
                value1 = value
              end
              expect(@homepage.goto_office.text_details(key,value1).text).to eql(contacts['contact1'][key.downcase][value.downcase]) 
            end
          else
            it "verifies #{key} #{value} details do not exist" do
              if value.eql?"Work"
                value1 = "Business"
              else
                value1 = value
              end
              expect(@homepage.goto_office.text_details(key,value1)).not_to be_present
            end
          end
        end
      when "Send email"
        people[key].each do |value|
          if !contacts['contact1'][value.downcase].to_s.empty?
            it "verifies #{key} #{value} details are valid" do
              expect(@homepage.goto_office.link_details(key,value).text).to eql(contacts['contact1'][value.downcase])
            end
          else
            it "verifies #{key} #{value} details do not exist" do
              expect(@homepage.goto_office.link_details(key,value)).not_to be_present
            end
          end
        end
      when "Address"
        people[key].each do |value|
          if !contacts['contact1'][key.downcase][value.downcase].to_s.empty?
            it "verifies #{key} #{value} details are valid" do
              if value.eql?"Work"
                value1 = "Business"
              else
                value1 = value
              end
              address = contacts['contact1'][key.downcase][value.downcase]['street'].to_s + ' ' + contacts['contact1'][key.downcase][value.downcase]['city'].to_s + ' ' + contacts['contact1'][key.downcase][value.downcase]['state'].to_s + ' ' + contacts['contact1'][key.downcase][value.downcase]['postal'].to_s + ' ' + contacts['contact1'][key.downcase][value.downcase]['country'].to_s
              full_address = address.gsub(/\s{1,}/,' ')
              expect(@homepage.goto_office.address_details(value1).text).to eql(full_address)
            end
          else
            it "verifies #{key} #{value} details do not exist" do
              if value.eql?"Work"
                value1 = "Business"
              else
                value1 = value
              end
              expect(@homepage.goto_office.address_details(value1)).not_to be_present
            end
          end
        end
      when "IM"
        if !contacts['contact1'][key.downcase].to_s.empty?
          it "verifies #{key} details are valid" do
            expect(@homepage.goto_office.no_label_details(key).text).to eql(contacts['contact1'][key.downcase])
          end
        else
          it "verifies #{key} details do not exist" do
            expect(@homepage.goto_office.no_label_details(key)).not_to be_present
          end
        end
      when "Other"
        people[key].each do |value|
          if !contacts['contact1'][value.downcase].to_s.empty?
            it "verifies #{key} #{value} details are valid" do
              if value.eql?("Web page")
                expect(@homepage.goto_office.link_details(key,value).text).to eql(contacts['contact1'][value.downcase])
              else
                expect(@homepage.goto_office.text_details(key,value).text).to eql(contacts['contact1'][value.downcase])
              end
            end
          else
            it "verifies #{key} #{value} details do not exist" do
              expect(@homepage.goto_office.link_details(key,value)).not_to be_present
            end
          end
        end
      end
    end
  end
#=end
end