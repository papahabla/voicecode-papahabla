pack = Packages.register
  name: 'papahabla'
  description: 'The stuff for me'
  scope: 'abstract'

pack.commands
  'vc-commands-search':
    spoken: 'queen'
    grammarType: 'textCapture'
    description: 'find all in project'
    tags: ['papahabla', 'voicecode', 'search']
    action: (input) ->
      window = global.windowController.get('main')
      window.show()
      window.focus()
      emit 'changePage', 'commands'
      @do 'common:find'
      @do 'selection:current-line'
      if input
        @string input

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
