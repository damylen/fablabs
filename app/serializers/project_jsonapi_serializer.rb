class ProjectJsonapiSerializer < ActiveModel::Serializer
  attributes :id, :type
  attribute :data, key: :attributes

  def data
    {
      title: object.title,
      description: object.description,
      faq: object.faq,
      github: object.github,
      web: object.web,
      dropbox: object.dropbox,
      bitbucket:   object.bitbucket,
      created_at: object.created_at,
      updated_at: object.updated_at,
      vimeo: object.vimeo,
      flickr: object.flickr,
      youtube: object.youtube,
      drive: object.drive,
      twitter: object.twitter,
      facebook: object.facebook,
      googleplus: object.googleplus,
      instagram: object.instagram,
      status: object.status,
      version: object.version,
      scope: object.scope,
      community: object.community,
      lookingfor: object.lookingfor,
      cover: object.project_cover,
      documents: object.documents,
      owner: owner(object.owner),
      collaborators: collaborations,
      contributors: contributions,
      lab: lab(object.lab)
    }
  end

  def collaborations
    object.collaborations.map {|c| Hash[lab(c.collaborator)] }
  end

  def contributions
    object.contributions.map {|c| Hash[user(c.contributor)] }
  end

  def user(u)
    {
      id: u.id,
      full_name: u.full_name,
      avatar: u.avatar
    }
  end

  def lab(l)
    {
      name: l.name,
      kind: l.kind_name,
      slug: l.slug,
      avatar: l.avatar,
    }
  end

  def owner(user)
    {
      id: user.id,
      full_name: user.full_name,
      avatar: user.avatar
    }
  end

  def type
    "projects"
  end

end