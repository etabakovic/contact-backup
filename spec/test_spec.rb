describe "Test", :broken => false do

  full_path = File.dirname(File.dirname(__FILE__)) + '/lib/data/contact.yaml'
  contacts = YAML::load(File.open(full_path))

  original = contacts["contact1"]

  include_context "Login"

  context "Search contact" do

    # it "goes to restore to track progress" do
    #   @homepage.wait_present(@homepage.goto_cloudfinder.reports)
    #   @homepage.goto_cloudfinder.reports.click
    #   @homepage.wait_present(@homepage.goto_cloudfinder.restore_reports)
    #   @homepage.goto_cloudfinder.restore_reports.click
    # end

    # it "waits for restore to complete" do
    #   @homepage.wait_present(@homepage.goto_cloudfinder.status_check(1))
    #   @homepage.wait_status(@homepage.goto_cloudfinder.status_check(1),nil,nil)
    #   #expect(@homepage.goto_cloudfinder.status_check(1).text).to eql('Completed')
    # end

#=begin
    it "enter and search contact name" do
      @browser.send_keys :f11
      @homepage.wait_present(@homepage.goto_cloudfinder.search_header)
      @homepage.goto_cloudfinder.search_header.set contacts['contact1']['first_name']
      @homepage.goto_cloudfinder.search_header.send_keys :return
      @homepage.wait_present(@homepage.goto_cloudfinder.contact_name(contacts["contact1"]["name"]))
      #@homepage.goto_cloudfinder.contact_checkbox('Yosemite Sam').set
      @homepage.goto_cloudfinder.sort_by.click
      @homepage.goto_cloudfinder.relevance('Backup date').click
      @homepage.wait_present(@homepage.goto_cloudfinder.contact_name(contacts['contact1']['name']))
      puts @homepage.goto_cloudfinder.contact_name(contacts['contact1']['name']).text
      @homepage.goto_cloudfinder.contact_name(contacts['contact1']['name']).click
      @homepage.wait_present(@homepage.goto_cloudfinder.backup_list)
      @homepage.goto_cloudfinder.backup_list.click
      @homepage.goto_cloudfinder.select_backup('2016-08-15 10:14:10').click
      @browser.scroll.to :center
      @homepage.wait_present(@homepage.goto_cloudfinder.view_file)
      @homepage.goto_cloudfinder.view_file.click
      @browser.scroll.to :top
      @homepage.wait_present(@homepage.goto_cloudfinder.address('work'))
      puts @homepage.goto_cloudfinder.main('Name').text
      puts @homepage.goto_cloudfinder.main('Updated').text
      puts @homepage.goto_cloudfinder.address('work').text
      #puts @homepage.goto_cloudfinder.email('work').text
      puts @homepage.goto_cloudfinder.phone('work').text
      puts contacts.length
      puts contacts['email']
    end

#     it "verifies original backup address" do
#       address = original['address'].to_s + ' ' + original['postal'].to_s + ' ' + original['city'].to_s + ' ' + original['country'].to_s
#       full_address = address.gsub(/\s{1,}/,' ')
#       expect(@homepage.goto_cloudfinder.address('work').text).to eql(full_address)
#     end

#     it "verifies original backup email does not exist" do
#       expect(@homepage.goto_cloudfinder.email('work')).not_to be_present
#     end

#     it "verifies original backup phone" do
#       expect(@homepage.goto_cloudfinder.phone('work').text).to eql(original['phone'])
#     end

#     it "click on restore" do
#       @homepage.goto_cloudfinder.restore.click
#     end

#     it "specify user" do
#       @homepage.wait_present(@homepage.goto_cloudfinder.restore_to_user)
#       @homepage.goto_cloudfinder.restore_to_user.click
#       @homepage.wait_present(@homepage.goto_cloudfinder.specify_user)
#       @homepage.goto_cloudfinder.specify_user.set original['user']
#       @homepage.wait_present(@homepage.goto_cloudfinder.user_match(original['user']))
#       @homepage.goto_cloudfinder.user_match(original['user']).click
#     end

#     it "specify location" do
#       @homepage.wait_present(@homepage.goto_cloudfinder.restore_name)
#       @homepage.goto_cloudfinder.restore_name.set 'Restore' + Time.now.to_i.to_s
#     end

#     it "initiates restore" do
#       @homepage.goto_cloudfinder.proceed.click
#       @homepage.wait_present(@homepage.goto_cloudfinder.restore_modal)
#       @homepage.goto_cloudfinder.restore_modal.click
#     end

#     it "waits for restore to start" do
#       @homepage.wait_present(@homepage.goto_cloudfinder.restoring_modal)
#       @homepage.goto_cloudfinder.restoring_modal.click
#     end

#     it "closes modal" do
#       @homepage.wait_present(@homepage.goto_cloudfinder.close_modal)
#       @homepage.goto_cloudfinder.close_modal.click
#     end
# #=end

#     it "goes to restore to track progress" do
#       @homepage.wait_present(@homepage.goto_cloudfinder.reports)
#       @homepage.goto_cloudfinder.reports.click
#       @homepage.wait_present(@homepage.goto_cloudfinder.restore_reports)
#       @homepage.goto_cloudfinder.restore_reports.click
#     end

#     it "waits for restore to complete" do
#       @homepage.wait_present(@homepage.goto_cloudfinder.status_check(1))
#       @homepage.wait_status(@homepage.goto_cloudfinder.status_check(1),'Completed')
#     end
  end
end