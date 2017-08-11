@browser @sdk
Feature: SDK File Upload Tests

  Scenario Outline: I should be able to upload a passport and an image of a face correctly.
    Given I navigate to the SDK
    When I click on verify_identity (SDK)
    Then I should see 3 document_select_buttons ()
    When I click on passport ()
    Then page_title () should contain "Upload the front of your document"
    When I upload french_passport <type> on file_upload ()
    Then I should see uploaded_<type>image ()
    And confirmation_text () should contain "Please confirm that you are happy with this photo."
    When I click on confirm ()
    Then page_title () should contain "Upload a picture of your face"
    When I upload one_face on file_upload ()
    Then I should see uploaded_image ()
    And confirmation_text () should contain "Please confirm that you are happy with this photo."
    When I click on confirm ()
    Then complete_text () should contain "Verification complete"

    Examples:
      | type |
      |      |
      | pdf  |

  Scenario Outline: I should be able to upload a two-sided identity document and an image of a face correctly.
    Given I navigate to the SDK
    When I click on verify_identity (SDK)
    Then I should see 3 document_select_buttons ()
    When I click on identity_card ()
    Then page_title () should contain "Upload the front of your document"
    When I upload french_national_identity_card <type> on file_upload ()
    Then I should see uploaded_<type>image ()
    And confirmation_text () should contain "Please confirm that you are happy with this photo."
    When I click on confirm ()
    Then page_title () should contain "Upload the back of your document"
    When I upload french_national_identity_card <type> on file_upload ()
    Then I should see uploaded_<type>image ()
    And confirmation_text () should contain "Please confirm that you are happy with this photo."
    When I click on confirm ()
    Then page_title () should contain "Upload a picture of your face"
    When I upload one_face on file_upload ()
    Then I should see uploaded_image ()
    And confirmation_text () should contain "Please confirm that you are happy with this photo."
    When I click on confirm ()
    Then complete_text () should contain "Verification complete"

    Examples:
      | type |
      |      |
      | pdf  |

  Scenario Outline: I should be able to upload a two-sided driving license and an image of a face correctly.
    Given I navigate to the SDK
    When I click on verify_identity (SDK)
    Then I should see 3 document_select_buttons ()
    When I click on driving_license ()
    Then page_title () should contain "Upload the front of your document"
    When I upload uk_driving_licence <type> on file_upload ()
    Then I should see uploaded_<type>image ()
    And confirmation_text () should contain "Please confirm that you are happy with this photo."
    When I click on confirm ()
    Then page_title () should contain "Upload the back of your document"
    When I upload uk_driving_licence <type> on file_upload ()
    Then I should see uploaded_<type>image ()
    And confirmation_text () should contain "Please confirm that you are happy with this photo."
    When I click on confirm ()
    Then page_title () should contain "Upload a picture of your face"
    When I upload one_face on file_upload ()
    Then I should see uploaded_image ()
    And confirmation_text () should contain "Please confirm that you are happy with this photo."
    When I click on confirm ()
    Then complete_text () should contain "Verification complete"

    Examples:
      | type |
      |      |
      | pdf  |

  Scenario Outline: I should not be able to upload a document which is clearly not a passport.
    Given I navigate to the SDK
    When I click on verify_identity (SDK)
    And I click on passport ()
    Then page_title () should contain "Upload the front of your document"
    When I upload llama <type> on file_upload ()
    Then I should see uploaded_<type>image ()
    And confirmation_text () should contain "Please confirm that you are happy with this photo."
    When I click on confirm ()
    Then error_message () should contain "We are unable to detect an identity document in this image. Please try again."

    Examples:
      | type |
      |      |
      | pdf  |

  Scenario: I should not be able to upload a document over 10MB.
    Given I navigate to the SDK
    When I click on verify_identity (SDK)
    And I click on passport ()
    Then page_title () should contain "Upload the front of your document"
    When I upload over_10mb_face on file_upload ()
    Then error_message () should contain "The file size limit of 10MB has been exceeded. Please try again."

  Scenario: I should not be able to upload an image of a face over 10MB.
    Given I navigate to the SDK
    When I click on verify_identity (SDK)
    And I click on passport ()
    Then page_title () should contain "Upload the front of your document"
    When I upload french_passport on file_upload ()
    Then I should see uploaded_image ()
    And confirmation_text () should contain "Please confirm that you are happy with this photo."
    When I click on confirm ()
    Then page_title () should contain "Upload a picture of your face"
    When I upload over_10mb_face on file_upload ()
    Then error_message () should contain "The file size limit of 10MB has been exceeded. Please try again."

  Scenario Outline: I can use the take again functionality if I'm not happy with the image I uploaded.
    Given I navigate to the SDK
    When I click on verify_identity (SDK)
    And I click on passport ()
    Then page_title () should contain "Upload the front of your document"
    When I upload french_passport <type> on file_upload ()
    Then I should see uploaded_<type>image ()
    And confirmation_text () should contain "Please confirm that you are happy with this photo."
    When I click on take_again ()
    Then page_title () should contain "Upload the front of your document"
    When I upload french_passport <type> on file_upload ()
    Then I should see uploaded_<type>image ()
    And confirmation_text () should contain "Please confirm that you are happy with this photo."
    When I click on confirm ()
    Then page_title () should contain "Upload a picture of your face"
    When I upload one_face on file_upload ()
    Then I should see uploaded_image ()
    And confirmation_text () should contain "Please confirm that you are happy with this photo."
    When I click on take_again ()
    Then page_title () should contain "Upload a picture of your face"
    When I upload one_face on file_upload ()
    Then I should see uploaded_image ()
    And confirmation_text () should contain "Please confirm that you are happy with this photo."
    When I click on confirm ()
    Then complete_text () should contain "Verification complete"

    Examples:
      | type |
      |      |
      | pdf  |
