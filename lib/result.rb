class Result

    def initialize
        @valid = true
        @text = {}
        @mods = {}
        @valid_values = {
            type: ['default', 'file', 'file:skipcheck'],
            icon: ['fileicon', 'filetype'],
            text: ['copy', 'largetype'],
            mod: ['shift', 'fn', 'ctrl', 'alt', 'cmd']
        }
    end

    public
    def valid(valid)
        @valid = !!valid
        self
    end

    public
    def type(type, verify_existence = true)
        return self unless @valid_values[:type].include?(type.to_s)

        if type === 'file' && !verify_existence
            @type = 'file:skipcheck'
        else
            @type = type
        end

        self
    end

    public
    def icon(path, type = nil)
        @icon = {
            path: path
        }

        @icon[:type] = type if @valid_values[:icon].include?(type.to_s)

        self
    end

    public
    def fileicon_icon(path)
        icon(path, 'fileicon')
    end

    public
    def filetype_icon(path)
        icon(path, 'filetype')
    end

    public
    def subtitle(subtitle)
        @subtitle = subtitle

        self
    end

    public
    def title(title)
        @title = title

        self
    end

    public
    def uid(uid)
        @uid = uid

        self
    end

    public
    def quicklookurl(quicklookurl)
        @quicklookurl = quicklookurl

        self
    end

    public
    def arg(arg)
        @arg = arg

        self
    end

    public
    def autocomplete(autocomplete)
        @autocomplete = autocomplete

        self
    end

    public
    def text(type, text)
        return self unless @valid_values[:text].include?(type.to_s)

        @text[type.to_sym] = text

        self
    end

    public
    def mod(mod, subtitle, arg, valid = true)
        return self unless @valid_values[:mod].include?(mod.to_s)

        @mods[mod.to_sym] = {
            subtitle: subtitle,
            arg: arg,
            valid: subtitle
        }

        self
    end

    public
    def to_hash
        keys = [
            'uid',
            'arg',
            'autocomplete',
            'title',
            'subtitle',
            'type',
            'valid',
            'quicklookurl',
            'icon',
            'mods',
            'text',
        ]

        result = {}

        keys.each { |key|
            result[key.to_sym] = self.instance_variable_get("@#{key}")
        }

        result.select { |hash_key, hash_value|
            (hash_value.class.to_s === 'Hash' && !hash_value.empty?) || (hash_value.class.to_s != 'Hash' && !hash_value.nil?)
        }
    end

    def method_missing(method, *arguments)
        if @valid_values[:mod].include?(method.to_s)
            return mod(method, *arguments)
        end

        if @valid_values[:text].include?(method.to_s)
            return text(method, *arguments)
        end
    end

end
