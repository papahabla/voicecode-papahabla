pack = Packages.register
  name: 'papahabla'
  description: 'The stuff for me'
  scope: 'abstract'

pack.commands
  'vc-commands-search':
    spoken: 'queen'
    grammarType: 'textCapture'
    description: "show voice code commands window and optionally search description for whatever is spoken next.  'help voice tag' will start the search and tag mode.  'help voice tag select' will search the command page for the tag: select"
    continuous: false
    enabled: true
    grammarType: "textCapture"
    action: (input) ->
      window = global.windowController.get('main')
      window.show()
      window.focus()

      @do 'core:show-commands-page'
      @delay 500
      @do 'common:find'
      @do 'delete:lines'
      if input[0] == 'tag'
        @string 'tag:'
        input = input[1..]
      else if input[0] == 'package'
        @string 'package:'
        input = input[1..]
      else if input[0] == 'spoken' or input[0] == 'commands'
        @string 'commands:'
        input = input[1..]
      else
        @string 'description:'

      if input?
        @string input.join(' ')

  'italy':
    spoken: 'italy'
    description: 'Italicize text'
    tags: ['text', 'formatting', 'italics']
    action: ->
      @key 'I', 'command'

  'bosnia':
    spoken: 'bosnia'
    description: 'Bold text'
    tags: ['text', 'formatting', 'bold']
    action: ->
      @key 'B', 'command'

  'husky':
    spoken: 'husky'
    description: 'Set the header level'
    tags: ['text', 'formatting', 'header']
    #grammarType: "integerCapture"
    action: (input) ->
      # if input?
      #   @key '#{input}', 'command'
      # else
      @key '2', 'command'

  'common-enter-shift':
    spoken: 'shifshock'
    description: 'Shift+Enter key'
    tags: ['text', 'formatting', 'header']
    action: (input) ->
      @key 'enter', 'shift'

  'common-enter-command':
    spoken: 'chom shock'
    description: 'Command+Enter key'
    tags: ['text', 'formatting', 'header']
    action: (input) ->
      @key 'enter', 'command'

  'common-enter-alt':
    spoken: 'all shook'
    description: 'Alt+Enter key'
    tags: ['text', 'formatting', 'header']
    action: (input) ->
      @key 'enter', 'alt'
