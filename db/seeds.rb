I18n.locale = :en

user = User.create!(:email => "admin@example.com", :password => 'password', :password_confirmation => 'password')
user_role = user.user_roles.create!(:role => "admin")

# home page and menu item
PaperTrail.whodunnit = user

home_text = File.read(File.join(Rails.root, "db", "content", "home.txt"))

page = Page.create!(:title => "Home", :body => home_text)
page2 = Page.create!(:title => "About", :body => "Who we are?!!")
menu = Menu.create!(:name => "main_menu", :display_name => "Main Menu")
menu_item = MenuItem.create!(:title => page.title, :page_id => page.id, :menu_id => menu.id)
menu_item2 = MenuItem.create!(:title => page2.title, :page_id => page2.id, :menu_id => menu.id)

# default settings
Setting.set("site_name", "mopxcms", nil, true)
Setting.set("tagline", "Rails starter app", nil, true)
Setting.set("language", "en", nil, true)
Setting.set("mail_sender", "admin@example.com", nil, true)
Setting.set("support_email", "admin@example.com", nil, true)
Setting.set("robots_txt", "# User-Agent: *\n# Disallow: /", nil, true)
