shared_context "Office login" do
  
  #context "Login to Office365" do
    it "enters username" do
      @homepage.wait_present(@homepage.goto_office.username)
      @homepage.goto_office.username.set $config["office"]["username"]
    end

    it "enters password" do
      @homepage.wait_present(@homepage.goto_office.password)
      @homepage.goto_office.password.set $config["office"]["password"]
    end

    it "click on login" do
      sleep 2
      @homepage.goto_office.sign_in.click
      @homepage.wait_not_present(@homepage.goto_office.sign_in)
    end
  #end

end