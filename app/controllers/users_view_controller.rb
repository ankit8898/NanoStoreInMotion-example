class UsersViewController < UIViewController

  HEADER_LABEL_TAG = 1
  NAME_TEXT_FIELD_TAG = 2
  EMAIL_FIELD_TAG = 3
  BUTTON_TAG = 4

   def loadView
    views = NSBundle.mainBundle.loadNibNamed "UsersViewController", owner:self, options:nil
    self.view = views[0]
   end

  def viewDidLoad
    @label_top = label_top
    @text_field_name = text_field1
    @text_field_mail = text_field2
    @tap_gesture_recognizer = tap_gesture_recognizer
    @button = button
    #@label_top.delegate = self
    self.view.addSubview(@label_top)
    self.view.addSubview(@text_field)
    self.view.addGestureRecognizer(@tap_gesture_recognizer)
    self.view.addSubview(@button)
  end


  def dismissKeyboard(tap_gesture_recognizer)
    @text_field_name.resignFirstResponder
    @text_field_mail.resignFirstResponder
  end
  
  def tap_gesture_recognizer
    UITapGestureRecognizer.alloc.initWithTarget(self,action:'dismissKeyboard:')
  end
  
  def button
   btn = self.view.viewWithTag(4)
   btn.addTarget(self, action:'enter', forControlEvents:UIControlEventTouchUpInside)
  end

  def enter
    unless isvalidForm
      User.create_new @text_field_name.text , @text_field_mail.text 
      showAlert("Success", title:"Added.")
      p User.all
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
    self.view.viewWithTag(5)
    #label
  end

  def text_field1
    self.view.viewWithTag(2)
  end

    def text_field2
    self.view.viewWithTag(3)
  end
end