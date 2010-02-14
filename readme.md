# Bosco

A form/output generator.

For the original feature set, the generator will have two api calls:

* new
* build_form  
* build_output

## new

* form_template hash object [:form, :output, :css, :javascript]

## build_form

Will take the following input

* action string object
* method string object
* [data hash] - when set it will tell the engine to associate data with questions.

And will return the following string object

* A html document in the form of a string 

This html document will include the html representation of the form template hash and embed the css and javascript in the object as well.


## build_output

Will take the following input

* hash of objects

And will return an html document based on the output template node

## What is a form template

A form template is a ruby hash that can contain one form, multiple pages, and multiple questions within each page.  Then it can also contain an output template on the form object.  Below is a sample template object

    form_template = {:name => 'contact', :pages => [
      { :name => 'main', 
        :title => 'Contact Us', 
        :description => 'Enter your name and problem:', 
        :questions => [
        { 
          :name => 'name', 
          :title => 'What is your name?', 
          :help_text => 'Please ener your full name.', 
          :type => 'text', :required => false
        },
        {
          :name => 'problem', 
          :title => 'How may we help you?', 
          :help_text => 'Please ener problem.', 
          :type => 'paragraph', :required => false          
        }
      ]}
      
    ], 
    :output => "Thank you #{name}, we will answer your question: #{problem} shortly"
    }
    
## Form Object

The form object contains an is_valid? method that takes data as an attribute.


## Question types

* text
* paragraph
* multiple choice
* checkboxes
* list
* scale
* grid
* section

## Question Type Spec for text 

    {
      :name => 'text_question',
      :title => 'What is your favorite color?',
      :help_text => '',
      :type => 'text',
      :required => true,
      :value => 'red'
    }

## Question Type Spec for paragraph

    {
      :name => 'paragraph_question',
      :title => 'Why?',
      :help_text => '',
      :type => 'paragraph',
      :required => false
    }

## Question Type Spec for multiple choice

    {
      :name => 'mc_question',
      :title => 'Select your favorite shape',
      :help_text => '',
      :type => 'multiple choice',
      :required => false,
      :options => [{'square','Large Red Square'},{'circle','Large Round Circle'},{'triangle','Triangle'}]
      
    }

## Question Type Spec for checkboxes

    {
      :name => 'checkbox_q',
      :title => 'Select your favorite animals',
      :help_text => '',
      :type => 'checkboxes',
      :required => false,
      :options => ['lion','tiger','bear','cat', 'dog']
    }


## Question Type Spec for list

    {
      :name => 'list',
      :title => 'Select your state',
      :help_text => '',
      :type => 'list',
      :required => false,
      :options => ['SC','GA','NC']
    }

## Question Type Spec for scale

    {
      :name => 'scale_q',
      :title => 'Select your favorite number',
      :help_text => '',
      :type => 'scale',
      :required => false,
      :start_value => 1,
      :stop_value => 10,
      :start_label => 'Min',
      :stop_label => 'Max'
    }


## Question Type Spec for grid

    {
      :name => 'grid_q',
      :title => 'Select one of the following',
      :help_text => '',
      :type => 'grid',
      :required => false,
      :columns => ['Y','N'],
      :rows => [{'pain','Pain?'}, {'vomitting','Vomiting?'},{'headache','Headache?'}]
    }

## Question Type Spec for section

    {
      :name => 'section_q',
      :title => 'Review',
      :description => '',
      :type => 'section'
    }
  