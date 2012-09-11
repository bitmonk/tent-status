class StatusPro.Views.Posts extends StatusPro.View
  templateName: 'posts'
  partialNames: ['_post', '_new_post_form']

  dependentRenderAttributes: ['posts']

  initialize: ->
    @container = StatusPro.Views.container
    super

  sortedPosts: => @posts.sortBy (post) -> -post.get('published_at')

  context: =>
    posts: _.map(@sortedPosts(), (post) -> _.extend post.toJSON(), {
      formatted:
        published_at: StatusPro.Helpers.formatTime post.get('published_at')
        full_published_at: StatusPro.Helpers.rawTime post.get('published_at')
    })