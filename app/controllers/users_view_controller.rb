class UsersViewController < UIViewController

  HEADER_LABEL_TAG = 5
  NAME_TEXT_FIELD_TAG = 2
  EMAIL_FIELD_TAG = 3
  BUTTON_TAG = 4

  def loadView
    views = NSBundle.mainBundle.loadNibNamed "UsersViewController", owner:self, options:nil
    self.view = views[0]
    self.title = "New User"
  end

  def viewDidLoad
    @label_top = label_top
    @text_field_name = text_field_name
    @text_field_mail = text_field_email
    @tap_gesture_recognizer = tap_gesture_recognizer
    @button = button
    subViewAdder [@label_top,@text_field,@button]
    self.view.addGestureRecognizer(@tap_gesture_recognizer)
  end


  def dismissKeyboard(tap_gesture_recognizer)
    @text_field_name.resignFirstResponder
    @text_field_mail.resignFirstResponder
  end
  
  def tap_gesture_recognizer
    UITapGestureRecognizer.alloc.initWithTarget(self,action:'dismissKeyboard:')
  end

  def enter
    unless isvalidForm
      User.create_new @text_field_name.text , @text_field_mail.text 
      clearField
      showAlert("Success", title:"Added User.")
    else
     showAlert("Error", title:"Please, fill all the fields.")
   end
 end

 def close
  dismissModalViewControllerAnimated true
end


def isvalidForm
 @text_field_name.text.empty? || @text_field_mail.text.empty?
end

def showAlert(message, title:title)
  alert = UIAlertView.alloc.initWithTitle(title,
    message:message,
    delegate:self,
    cancelButtonTitle:'OK',
    otherButtonTitles:nil)
  alert.show
end

def label_top
  self.view.viewWithTag HEADER_LABEL_TAG 
end

def text_field_name
  self.view.viewWithTag NAME_TEXT_FIELD_TAG
end

def text_field_email
  self.view.viewWithTag EMAIL_FIELD_TAG
end

def button
 btn = self.view.viewWithTag BUTTON_TAG
 btn.addTarget(self, action:'enter', forControlEvents:UIControlEventTouchUpInside)
end

def clearField
  @text_field_name.text, @text_field_mail.text =  NSString.new,  NSString.new      
end

def subViewAdder arr 
  arr.each {|field| self.view.addSubview field}
end
end