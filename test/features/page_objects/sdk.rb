class SDK

  def initialize(driver)
    @driver = driver
  end

#locators

  def verify_identity
    @driver.find_element(:css, '.onfido-sdk-ui-Theme-btn-primary')
  end

  def document_select_buttons
    @driver.find_elements(:css, '.onfido-sdk-ui-DocumentSelector-icon')
  end

  def identity_card
    @driver.find_element(:css, '.onfido-sdk-ui-DocumentSelector-icon-identity')
  end

  def driving_license
    @driver.find_element(:css, '.onfido-sdk-ui-DocumentSelector-icon-license')
  end

  def passport
    @driver.find_element(:css, '.onfido-sdk-ui-DocumentSelector-icon-passport')
  end

  def upload_icon
    @driver.find_element(:css, '.onfido-sdk-ui-Uploader-icon')
  end

  def file_upload
    element = @driver.find_element(:css, '.onfido-sdk-ui-Uploader-dropzone input[type="file"]')
    @driver.execute_script("return arguments[0].setAttribute('style','display: true');", element)
    @driver.execute_script("return arguments[0].value = '';", element) unless element.attribute('value').empty?
    element
  end

  def take_again
    @driver.find_element(:css, '.onfido-sdk-ui-Confirm-actions > button')
  end

  def confirm
    @driver.find_element(:css, '.onfido-sdk-ui-Confirm-actions > a')
  end

  def page_title
    @driver.find_element(:css, '.onfido-sdk-ui-Theme-title')
  end

  def confirmation_text
    @driver.find_element(:css, '.onfido-sdk-ui-Theme-step > p')
  end

  def uploaded_image
    @driver.find_element(:css, '.onfido-sdk-ui-Confirm-image')
  end

  def uploaded_pdfimage
    if ENV['BROWSER'] && ENV['BROWSER'].downcase == 'chrome' && @driver.browser == :chrome
      @driver.find_element(:css, '.pdfobject')
    else
      # we currently don't support pdf preview in Firefox, Safari, IE, Microsoft Edge, mobile browsers and chrome headless
      @driver.find_element(:css, '.onfido-sdk-ui-Confirm-pdfIcon')
    end
  end

  def complete_text
    @driver.find_element(:css, '.onfido-sdk-ui-Theme-step > h1')
  end

  def error_message
    @driver.find_element(:css, '.onfido-sdk-ui-Uploader-error')
  end

end

Given(/^I navigate to the SDK$/) do
  @driver.get SDK_SURGE_URL
end
