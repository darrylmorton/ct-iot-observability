// Code generated using 'make generate-crds'. DO NOT EDIT.
{ spec+: { versions+: [
  {
    name: 'v1beta1',
    schema: {
      openAPIV3Schema: {
        description: 'The `AlertmanagerConfig` custom resource definition (CRD) defines how `Alertmanager` objects process Prometheus alerts. It allows to specify alert grouping and routing, notification receivers and inhibition rules.\n\n`Alertmanager` objects select `AlertmanagerConfig` objects using label and namespace selectors.',
        properties: {
          apiVersion: {
            description: 'APIVersion defines the versioned schema of this representation of an object.\nServers should convert recognized schemas to the latest internal value, and\nmay reject unrecognized values.\nMore info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources',
            type: 'string',
          },
          kind: {
            description: 'Kind is a string value representing the REST resource this object represents.\nServers may infer this from the endpoint the client submits requests to.\nCannot be updated.\nIn CamelCase.\nMore info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds',
            type: 'string',
          },
          metadata: {
            type: 'object',
          },
          spec: {
            description: 'AlertmanagerConfigSpec is a specification of the desired behavior of the Alertmanager configuration.\nBy definition, the Alertmanager configuration only applies to alerts for which\nthe `namespace` label is equal to the namespace of the AlertmanagerConfig resource.',
            properties: {
              inhibitRules: {
                description: "List of inhibition rules. The rules will only apply to alerts matching\nthe resource's namespace.",
                items: {
                  description: 'InhibitRule defines an inhibition rule that allows to mute alerts when other\nalerts are already firing.\nSee https://prometheus.io/docs/alerting/latest/configuration/#inhibit_rule',
                  properties: {
                    equal: {
                      description: 'Labels that must have an equal value in the source and target alert for\nthe inhibition to take effect.',
                      items: {
                        type: 'string',
                      },
                      type: 'array',
                    },
                    sourceMatch: {
                      description: "Matchers for which one or more alerts have to exist for the inhibition\nto take effect. The operator enforces that the alert matches the\nresource's namespace.",
                      items: {
                        description: "Matcher defines how to match on alert's labels.",
                        properties: {
                          matchType: {
                            description: 'Match operator, one of `=` (equal to), `!=` (not equal to), `=~` (regex\nmatch) or `!~` (not regex match).\nNegative operators (`!=` and `!~`) require Alertmanager >= v0.22.0.',
                            enum: [
                              '!=',
                              '=',
                              '=~',
                              '!~',
                            ],
                            type: 'string',
                          },
                          name: {
                            description: 'Label to match.',
                            minLength: 1,
                            type: 'string',
                          },
                          value: {
                            description: 'Label value to match.',
                            type: 'string',
                          },
                        },
                        required: [
                          'name',
                        ],
                        type: 'object',
                      },
                      type: 'array',
                    },
                    targetMatch: {
                      description: "Matchers that have to be fulfilled in the alerts to be muted. The\noperator enforces that the alert matches the resource's namespace.",
                      items: {
                        description: "Matcher defines how to match on alert's labels.",
                        properties: {
                          matchType: {
                            description: 'Match operator, one of `=` (equal to), `!=` (not equal to), `=~` (regex\nmatch) or `!~` (not regex match).\nNegative operators (`!=` and `!~`) require Alertmanager >= v0.22.0.',
                            enum: [
                              '!=',
                              '=',
                              '=~',
                              '!~',
                            ],
                            type: 'string',
                          },
                          name: {
                            description: 'Label to match.',
                            minLength: 1,
                            type: 'string',
                          },
                          value: {
                            description: 'Label value to match.',
                            type: 'string',
                          },
                        },
                        required: [
                          'name',
                        ],
                        type: 'object',
                      },
                      type: 'array',
                    },
                  },
                  type: 'object',
                },
                type: 'array',
              },
              receivers: {
                description: 'List of receivers.',
                items: {
                  description: 'Receiver defines one or more notification integrations.',
                  properties: {
                    discordConfigs: {
                      description: 'List of Slack configurations.',
                      items: {
                        description: 'DiscordConfig configures notifications via Discord.\nSee https://prometheus.io/docs/alerting/latest/configuration/#discord_config',
                        properties: {
                          apiURL: {
                            description: "The secret's key that contains the Discord webhook URL.\nThe secret needs to be in the same namespace as the AlertmanagerConfig\nobject and accessible by the Prometheus Operator.",
                            properties: {
                              key: {
                                description: 'The key of the secret to select from.  Must be a valid secret key.',
                                type: 'string',
                              },
                              name: {
                                default: '',
                                description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                type: 'string',
                              },
                              optional: {
                                description: 'Specify whether the Secret or its key must be defined',
                                type: 'boolean',
                              },
                            },
                            required: [
                              'key',
                            ],
                            type: 'object',
                            'x-kubernetes-map-type': 'atomic',
                          },
                          httpConfig: {
                            description: 'HTTP client configuration.',
                            properties: {
                              authorization: {
                                description: 'Authorization header configuration for the client.\nThis is mutually exclusive with BasicAuth and is only available starting from Alertmanager v0.22+.',
                                properties: {
                                  credentials: {
                                    description: 'Selects a key of a Secret in the namespace that contains the credentials for authentication.',
                                    properties: {
                                      key: {
                                        description: 'The key of the secret to select from.  Must be a valid secret key.',
                                        type: 'string',
                                      },
                                      name: {
                                        default: '',
                                        description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                        type: 'string',
                                      },
                                      optional: {
                                        description: 'Specify whether the Secret or its key must be defined',
                                        type: 'boolean',
                                      },
                                    },
                                    required: [
                                      'key',
                                    ],
                                    type: 'object',
                                    'x-kubernetes-map-type': 'atomic',
                                  },
                                  type: {
                                    description: 'Defines the authentication type. The value is case-insensitive.\n\n"Basic" is not a supported value.\n\nDefault: "Bearer"',
                                    type: 'string',
                                  },
                                },
                                type: 'object',
                              },
                              basicAuth: {
                                description: 'BasicAuth for the client.\nThis is mutually exclusive with Authorization. If both are defined, BasicAuth takes precedence.',
                                properties: {
                                  password: {
                                    description: '`password` specifies a key of a Secret containing the password for\nauthentication.',
                                    properties: {
                                      key: {
                                        description: 'The key of the secret to select from.  Must be a valid secret key.',
                                        type: 'string',
                                      },
                                      name: {
                                        default: '',
                                        description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                        type: 'string',
                                      },
                                      optional: {
                                        description: 'Specify whether the Secret or its key must be defined',
                                        type: 'boolean',
                                      },
                                    },
                                    required: [
                                      'key',
                                    ],
                                    type: 'object',
                                    'x-kubernetes-map-type': 'atomic',
                                  },
                                  username: {
                                    description: '`username` specifies a key of a Secret containing the username for\nauthentication.',
                                    properties: {
                                      key: {
                                        description: 'The key of the secret to select from.  Must be a valid secret key.',
                                        type: 'string',
                                      },
                                      name: {
                                        default: '',
                                        description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                        type: 'string',
                                      },
                                      optional: {
                                        description: 'Specify whether the Secret or its key must be defined',
                                        type: 'boolean',
                                      },
                                    },
                                    required: [
                                      'key',
                                    ],
                                    type: 'object',
                                    'x-kubernetes-map-type': 'atomic',
                                  },
                                },
                                type: 'object',
                              },
                              bearerTokenSecret: {
                                description: "The secret's key that contains the bearer token to be used by the client\nfor authentication.\nThe secret needs to be in the same namespace as the AlertmanagerConfig\nobject and accessible by the Prometheus Operator.",
                                properties: {
                                  key: {
                                    description: 'The key of the secret to select from.  Must be a valid secret key.',
                                    minLength: 1,
                                    type: 'string',
                                  },
                                  name: {
                                    description: "The name of the secret in the object's namespace to select from.",
                                    minLength: 1,
                                    type: 'string',
                                  },
                                },
                                required: [
                                  'key',
                                  'name',
                                ],
                                type: 'object',
                              },
                              followRedirects: {
                                description: 'FollowRedirects specifies whether the client should follow HTTP 3xx redirects.',
                                type: 'boolean',
                              },
                              noProxy: {
                                description: '`noProxy` is a comma-separated string that can contain IPs, CIDR notation, domain names\nthat should be excluded from proxying. IP and domain names can\ncontain port numbers.\n\nIt requires Prometheus >= v2.43.0 or Alertmanager >= 0.25.0.',
                                type: 'string',
                              },
                              oauth2: {
                                description: 'OAuth2 client credentials used to fetch a token for the targets.',
                                properties: {
                                  clientId: {
                                    description: "`clientId` specifies a key of a Secret or ConfigMap containing the\nOAuth2 client's ID.",
                                    properties: {
                                      configMap: {
                                        description: 'ConfigMap containing data to use for the targets.',
                                        properties: {
                                          key: {
                                            description: 'The key to select.',
                                            type: 'string',
                                          },
                                          name: {
                                            default: '',
                                            description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                            type: 'string',
                                          },
                                          optional: {
                                            description: 'Specify whether the ConfigMap or its key must be defined',
                                            type: 'boolean',
                                          },
                                        },
                                        required: [
                                          'key',
                                        ],
                                        type: 'object',
                                        'x-kubernetes-map-type': 'atomic',
                                      },
                                      secret: {
                                        description: 'Secret containing data to use for the targets.',
                                        properties: {
                                          key: {
                                            description: 'The key of the secret to select from.  Must be a valid secret key.',
                                            type: 'string',
                                          },
                                          name: {
                                            default: '',
                                            description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                            type: 'string',
                                          },
                                          optional: {
                                            description: 'Specify whether the Secret or its key must be defined',
                                            type: 'boolean',
                                          },
                                        },
                                        required: [
                                          'key',
                                        ],
                                        type: 'object',
                                        'x-kubernetes-map-type': 'atomic',
                                      },
                                    },
                                    type: 'object',
                                  },
                                  clientSecret: {
                                    description: "`clientSecret` specifies a key of a Secret containing the OAuth2\nclient's secret.",
                                    properties: {
                                      key: {
                                        description: 'The key of the secret to select from.  Must be a valid secret key.',
                                        type: 'string',
                                      },
                                      name: {
                                        default: '',
                                        description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                        type: 'string',
                                      },
                                      optional: {
                                        description: 'Specify whether the Secret or its key must be defined',
                                        type: 'boolean',
                                      },
                                    },
                                    required: [
                                      'key',
                                    ],
                                    type: 'object',
                                    'x-kubernetes-map-type': 'atomic',
                                  },
                                  endpointParams: {
                                    additionalProperties: {
                                      type: 'string',
                                    },
                                    description: '`endpointParams` configures the HTTP parameters to append to the token\nURL.',
                                    type: 'object',
                                  },
                                  noProxy: {
                                    description: '`noProxy` is a comma-separated string that can contain IPs, CIDR notation, domain names\nthat should be excluded from proxying. IP and domain names can\ncontain port numbers.\n\nIt requires Prometheus >= v2.43.0 or Alertmanager >= 0.25.0.',
                                    type: 'string',
                                  },
                                  proxyConnectHeader: {
                                    additionalProperties: {
                                      items: {
                                        description: 'SecretKeySelector selects a key of a Secret.',
                                        properties: {
                                          key: {
                                            description: 'The key of the secret to select from.  Must be a valid secret key.',
                                            type: 'string',
                                          },
                                          name: {
                                            default: '',
                                            description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                            type: 'string',
                                          },
                                          optional: {
                                            description: 'Specify whether the Secret or its key must be defined',
                                            type: 'boolean',
                                          },
                                        },
                                        required: [
                                          'key',
                                        ],
                                        type: 'object',
                                        'x-kubernetes-map-type': 'atomic',
                                      },
                                      type: 'array',
                                    },
                                    description: 'ProxyConnectHeader optionally specifies headers to send to\nproxies during CONNECT requests.\n\nIt requires Prometheus >= v2.43.0 or Alertmanager >= 0.25.0.',
                                    type: 'object',
                                    'x-kubernetes-map-type': 'atomic',
                                  },
                                  proxyFromEnvironment: {
                                    description: 'Whether to use the proxy configuration defined by environment variables (HTTP_PROXY, HTTPS_PROXY, and NO_PROXY).\n\nIt requires Prometheus >= v2.43.0 or Alertmanager >= 0.25.0.',
                                    type: 'boolean',
                                  },
                                  proxyUrl: {
                                    description: '`proxyURL` defines the HTTP proxy server to use.',
                                    pattern: '^http(s)?://.+$',
                                    type: 'string',
                                  },
                                  scopes: {
                                    description: '`scopes` defines the OAuth2 scopes used for the token request.',
                                    items: {
                                      type: 'string',
                                    },
                                    type: 'array',
                                  },
                                  tlsConfig: {
                                    description: 'TLS configuration to use when connecting to the OAuth2 server.\nIt requires Prometheus >= v2.43.0.',
                                    properties: {
                                      ca: {
                                        description: 'Certificate authority used when verifying server certificates.',
                                        properties: {
                                          configMap: {
                                            description: 'ConfigMap containing data to use for the targets.',
                                            properties: {
                                              key: {
                                                description: 'The key to select.',
                                                type: 'string',
                                              },
                                              name: {
                                                default: '',
                                                description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                                type: 'string',
                                              },
                                              optional: {
                                                description: 'Specify whether the ConfigMap or its key must be defined',
                                                type: 'boolean',
                                              },
                                            },
                                            required: [
                                              'key',
                                            ],
                                            type: 'object',
                                            'x-kubernetes-map-type': 'atomic',
                                          },
                                          secret: {
                                            description: 'Secret containing data to use for the targets.',
                                            properties: {
                                              key: {
                                                description: 'The key of the secret to select from.  Must be a valid secret key.',
                                                type: 'string',
                                              },
                                              name: {
                                                default: '',
                                                description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                                type: 'string',
                                              },
                                              optional: {
                                                description: 'Specify whether the Secret or its key must be defined',
                                                type: 'boolean',
                                              },
                                            },
                                            required: [
                                              'key',
                                            ],
                                            type: 'object',
                                            'x-kubernetes-map-type': 'atomic',
                                          },
                                        },
                                        type: 'object',
                                      },
                                      cert: {
                                        description: 'Client certificate to present when doing client-authentication.',
                                        properties: {
                                          configMap: {
                                            description: 'ConfigMap containing data to use for the targets.',
                                            properties: {
                                              key: {
                                                description: 'The key to select.',
                                                type: 'string',
                                              },
                                              name: {
                                                default: '',
                                                description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                                type: 'string',
                                              },
                                              optional: {
                                                description: 'Specify whether the ConfigMap or its key must be defined',
                                                type: 'boolean',
                                              },
                                            },
                                            required: [
                                              'key',
                                            ],
                                            type: 'object',
                                            'x-kubernetes-map-type': 'atomic',
                                          },
                                          secret: {
                                            description: 'Secret containing data to use for the targets.',
                                            properties: {
                                              key: {
                                                description: 'The key of the secret to select from.  Must be a valid secret key.',
                                                type: 'string',
                                              },
                                              name: {
                                                default: '',
                                                description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                                type: 'string',
                                              },
                                              optional: {
                                                description: 'Specify whether the Secret or its key must be defined',
                                                type: 'boolean',
                                              },
                                            },
                                            required: [
                                              'key',
                                            ],
                                            type: 'object',
                                            'x-kubernetes-map-type': 'atomic',
                                          },
                                        },
                                        type: 'object',
                                      },
                                      insecureSkipVerify: {
                                        description: 'Disable target certificate validation.',
                                        type: 'boolean',
                                      },
                                      keySecret: {
                                        description: 'Secret containing the client key file for the targets.',
                                        properties: {
                                          key: {
                                            description: 'The key of the secret to select from.  Must be a valid secret key.',
                                            type: 'string',
                                          },
                                          name: {
                                            default: '',
                                            description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                            type: 'string',
                                          },
                                          optional: {
                                            description: 'Specify whether the Secret or its key must be defined',
                                            type: 'boolean',
                                          },
                                        },
                                        required: [
                                          'key',
                                        ],
                                        type: 'object',
                                        'x-kubernetes-map-type': 'atomic',
                                      },
                                      maxVersion: {
                                        description: 'Maximum acceptable TLS version.\n\nIt requires Prometheus >= v2.41.0.',
                                        enum: [
                                          'TLS10',
                                          'TLS11',
                                          'TLS12',
                                          'TLS13',
                                        ],
                                        type: 'string',
                                      },
                                      minVersion: {
                                        description: 'Minimum acceptable TLS version.\n\nIt requires Prometheus >= v2.35.0.',
                                        enum: [
                                          'TLS10',
                                          'TLS11',
                                          'TLS12',
                                          'TLS13',
                                        ],
                                        type: 'string',
                                      },
                                      serverName: {
                                        description: 'Used to verify the hostname for the targets.',
                                        type: 'string',
                                      },
                                    },
                                    type: 'object',
                                  },
                                  tokenUrl: {
                                    description: '`tokenURL` configures the URL to fetch the token from.',
                                    minLength: 1,
                                    type: 'string',
                                  },
                                },
                                required: [
                                  'clientId',
                                  'clientSecret',
                                  'tokenUrl',
                                ],
                                type: 'object',
                              },
                              proxyConnectHeader: {
                                additionalProperties: {
                                  items: {
                                    description: 'SecretKeySelector selects a key of a Secret.',
                                    properties: {
                                      key: {
                                        description: 'The key of the secret to select from.  Must be a valid secret key.',
                                        type: 'string',
                                      },
                                      name: {
                                        default: '',
                                        description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                        type: 'string',
                                      },
                                      optional: {
                                        description: 'Specify whether the Secret or its key must be defined',
                                        type: 'boolean',
                                      },
                                    },
                                    required: [
                                      'key',
                                    ],
                                    type: 'object',
                                    'x-kubernetes-map-type': 'atomic',
                                  },
                                  type: 'array',
                                },
                                description: 'ProxyConnectHeader optionally specifies headers to send to\nproxies during CONNECT requests.\n\nIt requires Prometheus >= v2.43.0 or Alertmanager >= 0.25.0.',
                                type: 'object',
                                'x-kubernetes-map-type': 'atomic',
                              },
                              proxyFromEnvironment: {
                                description: 'Whether to use the proxy configuration defined by environment variables (HTTP_PROXY, HTTPS_PROXY, and NO_PROXY).\n\nIt requires Prometheus >= v2.43.0 or Alertmanager >= 0.25.0.',
                                type: 'boolean',
                              },
                              proxyURL: {
                                description: 'Optional proxy URL.\n\nIf defined, this field takes precedence over `proxyUrl`.',
                                type: 'string',
                              },
                              proxyUrl: {
                                description: '`proxyURL` defines the HTTP proxy server to use.',
                                pattern: '^http(s)?://.+$',
                                type: 'string',
                              },
                              tlsConfig: {
                                description: 'TLS configuration for the client.',
                                properties: {
                                  ca: {
                                    description: 'Certificate authority used when verifying server certificates.',
                                    properties: {
                                      configMap: {
                                        description: 'ConfigMap containing data to use for the targets.',
                                        properties: {
                                          key: {
                                            description: 'The key to select.',
                                            type: 'string',
                                          },
                                          name: {
                                            default: '',
                                            description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                            type: 'string',
                                          },
                                          optional: {
                                            description: 'Specify whether the ConfigMap or its key must be defined',
                                            type: 'boolean',
                                          },
                                        },
                                        required: [
                                          'key',
                                        ],
                                        type: 'object',
                                        'x-kubernetes-map-type': 'atomic',
                                      },
                                      secret: {
                                        description: 'Secret containing data to use for the targets.',
                                        properties: {
                                          key: {
                                            description: 'The key of the secret to select from.  Must be a valid secret key.',
                                            type: 'string',
                                          },
                                          name: {
                                            default: '',
                                            description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                            type: 'string',
                                          },
                                          optional: {
                                            description: 'Specify whether the Secret or its key must be defined',
                                            type: 'boolean',
                                          },
                                        },
                                        required: [
                                          'key',
                                        ],
                                        type: 'object',
                                        'x-kubernetes-map-type': 'atomic',
                                      },
                                    },
                                    type: 'object',
                                  },
                                  cert: {
                                    description: 'Client certificate to present when doing client-authentication.',
                                    properties: {
                                      configMap: {
                                        description: 'ConfigMap containing data to use for the targets.',
                                        properties: {
                                          key: {
                                            description: 'The key to select.',
                                            type: 'string',
                                          },
                                          name: {
                                            default: '',
                                            description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                            type: 'string',
                                          },
                                          optional: {
                                            description: 'Specify whether the ConfigMap or its key must be defined',
                                            type: 'boolean',
                                          },
                                        },
                                        required: [
                                          'key',
                                        ],
                                        type: 'object',
                                        'x-kubernetes-map-type': 'atomic',
                                      },
                                      secret: {
                                        description: 'Secret containing data to use for the targets.',
                                        properties: {
                                          key: {
                                            description: 'The key of the secret to select from.  Must be a valid secret key.',
                                            type: 'string',
                                          },
                                          name: {
                                            default: '',
                                            description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                            type: 'string',
                                          },
                                          optional: {
                                            description: 'Specify whether the Secret or its key must be defined',
                                            type: 'boolean',
                                          },
                                        },
                                        required: [
                                          'key',
                                        ],
                                        type: 'object',
                                        'x-kubernetes-map-type': 'atomic',
                                      },
                                    },
                                    type: 'object',
                                  },
                                  insecureSkipVerify: {
                                    description: 'Disable target certificate validation.',
                                    type: 'boolean',
                                  },
                                  keySecret: {
                                    description: 'Secret containing the client key file for the targets.',
                                    properties: {
                                      key: {
                                        description: 'The key of the secret to select from.  Must be a valid secret key.',
                                        type: 'string',
                                      },
                                      name: {
                                        default: '',
                                        description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                        type: 'string',
                                      },
                                      optional: {
                                        description: 'Specify whether the Secret or its key must be defined',
                                        type: 'boolean',
                                      },
                                    },
                                    required: [
                                      'key',
                                    ],
                                    type: 'object',
                                    'x-kubernetes-map-type': 'atomic',
                                  },
                                  maxVersion: {
                                    description: 'Maximum acceptable TLS version.\n\nIt requires Prometheus >= v2.41.0.',
                                    enum: [
                                      'TLS10',
                                      'TLS11',
                                      'TLS12',
                                      'TLS13',
                                    ],
                                    type: 'string',
                                  },
                                  minVersion: {
                                    description: 'Minimum acceptable TLS version.\n\nIt requires Prometheus >= v2.35.0.',
                                    enum: [
                                      'TLS10',
                                      'TLS11',
                                      'TLS12',
                                      'TLS13',
                                    ],
                                    type: 'string',
                                  },
                                  serverName: {
                                    description: 'Used to verify the hostname for the targets.',
                                    type: 'string',
                                  },
                                },
                                type: 'object',
                              },
                            },
                            type: 'object',
                          },
                          message: {
                            description: "The template of the message's body.",
                            type: 'string',
                          },
                          sendResolved: {
                            description: 'Whether or not to notify about resolved alerts.',
                            type: 'boolean',
                          },
                          title: {
                            description: "The template of the message's title.",
                            type: 'string',
                          },
                        },
                        required: [
                          'apiURL',
                        ],
                        type: 'object',
                      },
                      type: 'array',
                    },
                    emailConfigs: {
                      description: 'List of Email configurations.',
                      items: {
                        description: 'EmailConfig configures notifications via Email.',
                        properties: {
                          authIdentity: {
                            description: 'The identity to use for authentication.',
                            type: 'string',
                          },
                          authPassword: {
                            description: "The secret's key that contains the password to use for authentication.\nThe secret needs to be in the same namespace as the AlertmanagerConfig\nobject and accessible by the Prometheus Operator.",
                            properties: {
                              key: {
                                description: 'The key of the secret to select from.  Must be a valid secret key.',
                                minLength: 1,
                                type: 'string',
                              },
                              name: {
                                description: "The name of the secret in the object's namespace to select from.",
                                minLength: 1,
                                type: 'string',
                              },
                            },
                            required: [
                              'key',
                              'name',
                            ],
                            type: 'object',
                          },
                          authSecret: {
                            description: "The secret's key that contains the CRAM-MD5 secret.\nThe secret needs to be in the same namespace as the AlertmanagerConfig\nobject and accessible by the Prometheus Operator.",
                            properties: {
                              key: {
                                description: 'The key of the secret to select from.  Must be a valid secret key.',
                                minLength: 1,
                                type: 'string',
                              },
                              name: {
                                description: "The name of the secret in the object's namespace to select from.",
                                minLength: 1,
                                type: 'string',
                              },
                            },
                            required: [
                              'key',
                              'name',
                            ],
                            type: 'object',
                          },
                          authUsername: {
                            description: 'The username to use for authentication.',
                            type: 'string',
                          },
                          from: {
                            description: 'The sender address.',
                            type: 'string',
                          },
                          headers: {
                            description: 'Further headers email header key/value pairs. Overrides any headers\npreviously set by the notification implementation.',
                            items: {
                              description: 'KeyValue defines a (key, value) tuple.',
                              properties: {
                                key: {
                                  description: 'Key of the tuple.',
                                  minLength: 1,
                                  type: 'string',
                                },
                                value: {
                                  description: 'Value of the tuple.',
                                  type: 'string',
                                },
                              },
                              required: [
                                'key',
                                'value',
                              ],
                              type: 'object',
                            },
                            type: 'array',
                          },
                          hello: {
                            description: 'The hostname to identify to the SMTP server.',
                            type: 'string',
                          },
                          html: {
                            description: 'The HTML body of the email notification.',
                            type: 'string',
                          },
                          requireTLS: {
                            description: 'The SMTP TLS requirement.\nNote that Go does not support unencrypted connections to remote SMTP endpoints.',
                            type: 'boolean',
                          },
                          sendResolved: {
                            description: 'Whether or not to notify about resolved alerts.',
                            type: 'boolean',
                          },
                          smarthost: {
                            description: 'The SMTP host and port through which emails are sent. E.g. example.com:25',
                            type: 'string',
                          },
                          text: {
                            description: 'The text body of the email notification.',
                            type: 'string',
                          },
                          tlsConfig: {
                            description: 'TLS configuration',
                            properties: {
                              ca: {
                                description: 'Certificate authority used when verifying server certificates.',
                                properties: {
                                  configMap: {
                                    description: 'ConfigMap containing data to use for the targets.',
                                    properties: {
                                      key: {
                                        description: 'The key to select.',
                                        type: 'string',
                                      },
                                      name: {
                                        default: '',
                                        description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                        type: 'string',
                                      },
                                      optional: {
                                        description: 'Specify whether the ConfigMap or its key must be defined',
                                        type: 'boolean',
                                      },
                                    },
                                    required: [
                                      'key',
                                    ],
                                    type: 'object',
                                    'x-kubernetes-map-type': 'atomic',
                                  },
                                  secret: {
                                    description: 'Secret containing data to use for the targets.',
                                    properties: {
                                      key: {
                                        description: 'The key of the secret to select from.  Must be a valid secret key.',
                                        type: 'string',
                                      },
                                      name: {
                                        default: '',
                                        description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                        type: 'string',
                                      },
                                      optional: {
                                        description: 'Specify whether the Secret or its key must be defined',
                                        type: 'boolean',
                                      },
                                    },
                                    required: [
                                      'key',
                                    ],
                                    type: 'object',
                                    'x-kubernetes-map-type': 'atomic',
                                  },
                                },
                                type: 'object',
                              },
                              cert: {
                                description: 'Client certificate to present when doing client-authentication.',
                                properties: {
                                  configMap: {
                                    description: 'ConfigMap containing data to use for the targets.',
                                    properties: {
                                      key: {
                                        description: 'The key to select.',
                                        type: 'string',
                                      },
                                      name: {
                                        default: '',
                                        description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                        type: 'string',
                                      },
                                      optional: {
                                        description: 'Specify whether the ConfigMap or its key must be defined',
                                        type: 'boolean',
                                      },
                                    },
                                    required: [
                                      'key',
                                    ],
                                    type: 'object',
                                    'x-kubernetes-map-type': 'atomic',
                                  },
                                  secret: {
                                    description: 'Secret containing data to use for the targets.',
                                    properties: {
                                      key: {
                                        description: 'The key of the secret to select from.  Must be a valid secret key.',
                                        type: 'string',
                                      },
                                      name: {
                                        default: '',
                                        description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                        type: 'string',
                                      },
                                      optional: {
                                        description: 'Specify whether the Secret or its key must be defined',
                                        type: 'boolean',
                                      },
                                    },
                                    required: [
                                      'key',
                                    ],
                                    type: 'object',
                                    'x-kubernetes-map-type': 'atomic',
                                  },
                                },
                                type: 'object',
                              },
                              insecureSkipVerify: {
                                description: 'Disable target certificate validation.',
                                type: 'boolean',
                              },
                              keySecret: {
                                description: 'Secret containing the client key file for the targets.',
                                properties: {
                                  key: {
                                    description: 'The key of the secret to select from.  Must be a valid secret key.',
                                    type: 'string',
                                  },
                                  name: {
                                    default: '',
                                    description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                    type: 'string',
                                  },
                                  optional: {
                                    description: 'Specify whether the Secret or its key must be defined',
                                    type: 'boolean',
                                  },
                                },
                                required: [
                                  'key',
                                ],
                                type: 'object',
                                'x-kubernetes-map-type': 'atomic',
                              },
                              maxVersion: {
                                description: 'Maximum acceptable TLS version.\n\nIt requires Prometheus >= v2.41.0.',
                                enum: [
                                  'TLS10',
                                  'TLS11',
                                  'TLS12',
                                  'TLS13',
                                ],
                                type: 'string',
                              },
                              minVersion: {
                                description: 'Minimum acceptable TLS version.\n\nIt requires Prometheus >= v2.35.0.',
                                enum: [
                                  'TLS10',
                                  'TLS11',
                                  'TLS12',
                                  'TLS13',
                                ],
                                type: 'string',
                              },
                              serverName: {
                                description: 'Used to verify the hostname for the targets.',
                                type: 'string',
                              },
                            },
                            type: 'object',
                          },
                          to: {
                            description: 'The email address to send notifications to.',
                            type: 'string',
                          },
                        },
                        type: 'object',
                      },
                      type: 'array',
                    },
                    msteamsConfigs: {
                      description: 'List of MSTeams configurations.\nIt requires Alertmanager >= 0.26.0.',
                      items: {
                        description: 'MSTeamsConfig configures notifications via Microsoft Teams.\nIt requires Alertmanager >= 0.26.0.',
                        properties: {
                          httpConfig: {
                            description: 'HTTP client configuration.',
                            properties: {
                              authorization: {
                                description: 'Authorization header configuration for the client.\nThis is mutually exclusive with BasicAuth and is only available starting from Alertmanager v0.22+.',
                                properties: {
                                  credentials: {
                                    description: 'Selects a key of a Secret in the namespace that contains the credentials for authentication.',
                                    properties: {
                                      key: {
                                        description: 'The key of the secret to select from.  Must be a valid secret key.',
                                        type: 'string',
                                      },
                                      name: {
                                        default: '',
                                        description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                        type: 'string',
                                      },
                                      optional: {
                                        description: 'Specify whether the Secret or its key must be defined',
                                        type: 'boolean',
                                      },
                                    },
                                    required: [
                                      'key',
                                    ],
                                    type: 'object',
                                    'x-kubernetes-map-type': 'atomic',
                                  },
                                  type: {
                                    description: 'Defines the authentication type. The value is case-insensitive.\n\n"Basic" is not a supported value.\n\nDefault: "Bearer"',
                                    type: 'string',
                                  },
                                },
                                type: 'object',
                              },
                              basicAuth: {
                                description: 'BasicAuth for the client.\nThis is mutually exclusive with Authorization. If both are defined, BasicAuth takes precedence.',
                                properties: {
                                  password: {
                                    description: '`password` specifies a key of a Secret containing the password for\nauthentication.',
                                    properties: {
                                      key: {
                                        description: 'The key of the secret to select from.  Must be a valid secret key.',
                                        type: 'string',
                                      },
                                      name: {
                                        default: '',
                                        description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                        type: 'string',
                                      },
                                      optional: {
                                        description: 'Specify whether the Secret or its key must be defined',
                                        type: 'boolean',
                                      },
                                    },
                                    required: [
                                      'key',
                                    ],
                                    type: 'object',
                                    'x-kubernetes-map-type': 'atomic',
                                  },
                                  username: {
                                    description: '`username` specifies a key of a Secret containing the username for\nauthentication.',
                                    properties: {
                                      key: {
                                        description: 'The key of the secret to select from.  Must be a valid secret key.',
                                        type: 'string',
                                      },
                                      name: {
                                        default: '',
                                        description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                        type: 'string',
                                      },
                                      optional: {
                                        description: 'Specify whether the Secret or its key must be defined',
                                        type: 'boolean',
                                      },
                                    },
                                    required: [
                                      'key',
                                    ],
                                    type: 'object',
                                    'x-kubernetes-map-type': 'atomic',
                                  },
                                },
                                type: 'object',
                              },
                              bearerTokenSecret: {
                                description: "The secret's key that contains the bearer token to be used by the client\nfor authentication.\nThe secret needs to be in the same namespace as the AlertmanagerConfig\nobject and accessible by the Prometheus Operator.",
                                properties: {
                                  key: {
                                    description: 'The key of the secret to select from.  Must be a valid secret key.',
                                    minLength: 1,
                                    type: 'string',
                                  },
                                  name: {
                                    description: "The name of the secret in the object's namespace to select from.",
                                    minLength: 1,
                                    type: 'string',
                                  },
                                },
                                required: [
                                  'key',
                                  'name',
                                ],
                                type: 'object',
                              },
                              followRedirects: {
                                description: 'FollowRedirects specifies whether the client should follow HTTP 3xx redirects.',
                                type: 'boolean',
                              },
                              noProxy: {
                                description: '`noProxy` is a comma-separated string that can contain IPs, CIDR notation, domain names\nthat should be excluded from proxying. IP and domain names can\ncontain port numbers.\n\nIt requires Prometheus >= v2.43.0 or Alertmanager >= 0.25.0.',
                                type: 'string',
                              },
                              oauth2: {
                                description: 'OAuth2 client credentials used to fetch a token for the targets.',
                                properties: {
                                  clientId: {
                                    description: "`clientId` specifies a key of a Secret or ConfigMap containing the\nOAuth2 client's ID.",
                                    properties: {
                                      configMap: {
                                        description: 'ConfigMap containing data to use for the targets.',
                                        properties: {
                                          key: {
                                            description: 'The key to select.',
                                            type: 'string',
                                          },
                                          name: {
                                            default: '',
                                            description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                            type: 'string',
                                          },
                                          optional: {
                                            description: 'Specify whether the ConfigMap or its key must be defined',
                                            type: 'boolean',
                                          },
                                        },
                                        required: [
                                          'key',
                                        ],
                                        type: 'object',
                                        'x-kubernetes-map-type': 'atomic',
                                      },
                                      secret: {
                                        description: 'Secret containing data to use for the targets.',
                                        properties: {
                                          key: {
                                            description: 'The key of the secret to select from.  Must be a valid secret key.',
                                            type: 'string',
                                          },
                                          name: {
                                            default: '',
                                            description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                            type: 'string',
                                          },
                                          optional: {
                                            description: 'Specify whether the Secret or its key must be defined',
                                            type: 'boolean',
                                          },
                                        },
                                        required: [
                                          'key',
                                        ],
                                        type: 'object',
                                        'x-kubernetes-map-type': 'atomic',
                                      },
                                    },
                                    type: 'object',
                                  },
                                  clientSecret: {
                                    description: "`clientSecret` specifies a key of a Secret containing the OAuth2\nclient's secret.",
                                    properties: {
                                      key: {
                                        description: 'The key of the secret to select from.  Must be a valid secret key.',
                                        type: 'string',
                                      },
                                      name: {
                                        default: '',
                                        description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                        type: 'string',
                                      },
                                      optional: {
                                        description: 'Specify whether the Secret or its key must be defined',
                                        type: 'boolean',
                                      },
                                    },
                                    required: [
                                      'key',
                                    ],
                                    type: 'object',
                                    'x-kubernetes-map-type': 'atomic',
                                  },
                                  endpointParams: {
                                    additionalProperties: {
                                      type: 'string',
                                    },
                                    description: '`endpointParams` configures the HTTP parameters to append to the token\nURL.',
                                    type: 'object',
                                  },
                                  noProxy: {
                                    description: '`noProxy` is a comma-separated string that can contain IPs, CIDR notation, domain names\nthat should be excluded from proxying. IP and domain names can\ncontain port numbers.\n\nIt requires Prometheus >= v2.43.0 or Alertmanager >= 0.25.0.',
                                    type: 'string',
                                  },
                                  proxyConnectHeader: {
                                    additionalProperties: {
                                      items: {
                                        description: 'SecretKeySelector selects a key of a Secret.',
                                        properties: {
                                          key: {
                                            description: 'The key of the secret to select from.  Must be a valid secret key.',
                                            type: 'string',
                                          },
                                          name: {
                                            default: '',
                                            description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                            type: 'string',
                                          },
                                          optional: {
                                            description: 'Specify whether the Secret or its key must be defined',
                                            type: 'boolean',
                                          },
                                        },
                                        required: [
                                          'key',
                                        ],
                                        type: 'object',
                                        'x-kubernetes-map-type': 'atomic',
                                      },
                                      type: 'array',
                                    },
                                    description: 'ProxyConnectHeader optionally specifies headers to send to\nproxies during CONNECT requests.\n\nIt requires Prometheus >= v2.43.0 or Alertmanager >= 0.25.0.',
                                    type: 'object',
                                    'x-kubernetes-map-type': 'atomic',
                                  },
                                  proxyFromEnvironment: {
                                    description: 'Whether to use the proxy configuration defined by environment variables (HTTP_PROXY, HTTPS_PROXY, and NO_PROXY).\n\nIt requires Prometheus >= v2.43.0 or Alertmanager >= 0.25.0.',
                                    type: 'boolean',
                                  },
                                  proxyUrl: {
                                    description: '`proxyURL` defines the HTTP proxy server to use.',
                                    pattern: '^http(s)?://.+$',
                                    type: 'string',
                                  },
                                  scopes: {
                                    description: '`scopes` defines the OAuth2 scopes used for the token request.',
                                    items: {
                                      type: 'string',
                                    },
                                    type: 'array',
                                  },
                                  tlsConfig: {
                                    description: 'TLS configuration to use when connecting to the OAuth2 server.\nIt requires Prometheus >= v2.43.0.',
                                    properties: {
                                      ca: {
                                        description: 'Certificate authority used when verifying server certificates.',
                                        properties: {
                                          configMap: {
                                            description: 'ConfigMap containing data to use for the targets.',
                                            properties: {
                                              key: {
                                                description: 'The key to select.',
                                                type: 'string',
                                              },
                                              name: {
                                                default: '',
                                                description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                                type: 'string',
                                              },
                                              optional: {
                                                description: 'Specify whether the ConfigMap or its key must be defined',
                                                type: 'boolean',
                                              },
                                            },
                                            required: [
                                              'key',
                                            ],
                                            type: 'object',
                                            'x-kubernetes-map-type': 'atomic',
                                          },
                                          secret: {
                                            description: 'Secret containing data to use for the targets.',
                                            properties: {
                                              key: {
                                                description: 'The key of the secret to select from.  Must be a valid secret key.',
                                                type: 'string',
                                              },
                                              name: {
                                                default: '',
                                                description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                                type: 'string',
                                              },
                                              optional: {
                                                description: 'Specify whether the Secret or its key must be defined',
                                                type: 'boolean',
                                              },
                                            },
                                            required: [
                                              'key',
                                            ],
                                            type: 'object',
                                            'x-kubernetes-map-type': 'atomic',
                                          },
                                        },
                                        type: 'object',
                                      },
                                      cert: {
                                        description: 'Client certificate to present when doing client-authentication.',
                                        properties: {
                                          configMap: {
                                            description: 'ConfigMap containing data to use for the targets.',
                                            properties: {
                                              key: {
                                                description: 'The key to select.',
                                                type: 'string',
                                              },
                                              name: {
                                                default: '',
                                                description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                                type: 'string',
                                              },
                                              optional: {
                                                description: 'Specify whether the ConfigMap or its key must be defined',
                                                type: 'boolean',
                                              },
                                            },
                                            required: [
                                              'key',
                                            ],
                                            type: 'object',
                                            'x-kubernetes-map-type': 'atomic',
                                          },
                                          secret: {
                                            description: 'Secret containing data to use for the targets.',
                                            properties: {
                                              key: {
                                                description: 'The key of the secret to select from.  Must be a valid secret key.',
                                                type: 'string',
                                              },
                                              name: {
                                                default: '',
                                                description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                                type: 'string',
                                              },
                                              optional: {
                                                description: 'Specify whether the Secret or its key must be defined',
                                                type: 'boolean',
                                              },
                                            },
                                            required: [
                                              'key',
                                            ],
                                            type: 'object',
                                            'x-kubernetes-map-type': 'atomic',
                                          },
                                        },
                                        type: 'object',
                                      },
                                      insecureSkipVerify: {
                                        description: 'Disable target certificate validation.',
                                        type: 'boolean',
                                      },
                                      keySecret: {
                                        description: 'Secret containing the client key file for the targets.',
                                        properties: {
                                          key: {
                                            description: 'The key of the secret to select from.  Must be a valid secret key.',
                                            type: 'string',
                                          },
                                          name: {
                                            default: '',
                                            description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                            type: 'string',
                                          },
                                          optional: {
                                            description: 'Specify whether the Secret or its key must be defined',
                                            type: 'boolean',
                                          },
                                        },
                                        required: [
                                          'key',
                                        ],
                                        type: 'object',
                                        'x-kubernetes-map-type': 'atomic',
                                      },
                                      maxVersion: {
                                        description: 'Maximum acceptable TLS version.\n\nIt requires Prometheus >= v2.41.0.',
                                        enum: [
                                          'TLS10',
                                          'TLS11',
                                          'TLS12',
                                          'TLS13',
                                        ],
                                        type: 'string',
                                      },
                                      minVersion: {
                                        description: 'Minimum acceptable TLS version.\n\nIt requires Prometheus >= v2.35.0.',
                                        enum: [
                                          'TLS10',
                                          'TLS11',
                                          'TLS12',
                                          'TLS13',
                                        ],
                                        type: 'string',
                                      },
                                      serverName: {
                                        description: 'Used to verify the hostname for the targets.',
                                        type: 'string',
                                      },
                                    },
                                    type: 'object',
                                  },
                                  tokenUrl: {
                                    description: '`tokenURL` configures the URL to fetch the token from.',
                                    minLength: 1,
                                    type: 'string',
                                  },
                                },
                                required: [
                                  'clientId',
                                  'clientSecret',
                                  'tokenUrl',
                                ],
                                type: 'object',
                              },
                              proxyConnectHeader: {
                                additionalProperties: {
                                  items: {
                                    description: 'SecretKeySelector selects a key of a Secret.',
                                    properties: {
                                      key: {
                                        description: 'The key of the secret to select from.  Must be a valid secret key.',
                                        type: 'string',
                                      },
                                      name: {
                                        default: '',
                                        description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                        type: 'string',
                                      },
                                      optional: {
                                        description: 'Specify whether the Secret or its key must be defined',
                                        type: 'boolean',
                                      },
                                    },
                                    required: [
                                      'key',
                                    ],
                                    type: 'object',
                                    'x-kubernetes-map-type': 'atomic',
                                  },
                                  type: 'array',
                                },
                                description: 'ProxyConnectHeader optionally specifies headers to send to\nproxies during CONNECT requests.\n\nIt requires Prometheus >= v2.43.0 or Alertmanager >= 0.25.0.',
                                type: 'object',
                                'x-kubernetes-map-type': 'atomic',
                              },
                              proxyFromEnvironment: {
                                description: 'Whether to use the proxy configuration defined by environment variables (HTTP_PROXY, HTTPS_PROXY, and NO_PROXY).\n\nIt requires Prometheus >= v2.43.0 or Alertmanager >= 0.25.0.',
                                type: 'boolean',
                              },
                              proxyURL: {
                                description: 'Optional proxy URL.\n\nIf defined, this field takes precedence over `proxyUrl`.',
                                type: 'string',
                              },
                              proxyUrl: {
                                description: '`proxyURL` defines the HTTP proxy server to use.',
                                pattern: '^http(s)?://.+$',
                                type: 'string',
                              },
                              tlsConfig: {
                                description: 'TLS configuration for the client.',
                                properties: {
                                  ca: {
                                    description: 'Certificate authority used when verifying server certificates.',
                                    properties: {
                                      configMap: {
                                        description: 'ConfigMap containing data to use for the targets.',
                                        properties: {
                                          key: {
                                            description: 'The key to select.',
                                            type: 'string',
                                          },
                                          name: {
                                            default: '',
                                            description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                            type: 'string',
                                          },
                                          optional: {
                                            description: 'Specify whether the ConfigMap or its key must be defined',
                                            type: 'boolean',
                                          },
                                        },
                                        required: [
                                          'key',
                                        ],
                                        type: 'object',
                                        'x-kubernetes-map-type': 'atomic',
                                      },
                                      secret: {
                                        description: 'Secret containing data to use for the targets.',
                                        properties: {
                                          key: {
                                            description: 'The key of the secret to select from.  Must be a valid secret key.',
                                            type: 'string',
                                          },
                                          name: {
                                            default: '',
                                            description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                            type: 'string',
                                          },
                                          optional: {
                                            description: 'Specify whether the Secret or its key must be defined',
                                            type: 'boolean',
                                          },
                                        },
                                        required: [
                                          'key',
                                        ],
                                        type: 'object',
                                        'x-kubernetes-map-type': 'atomic',
                                      },
                                    },
                                    type: 'object',
                                  },
                                  cert: {
                                    description: 'Client certificate to present when doing client-authentication.',
                                    properties: {
                                      configMap: {
                                        description: 'ConfigMap containing data to use for the targets.',
                                        properties: {
                                          key: {
                                            description: 'The key to select.',
                                            type: 'string',
                                          },
                                          name: {
                                            default: '',
                                            description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                            type: 'string',
                                          },
                                          optional: {
                                            description: 'Specify whether the ConfigMap or its key must be defined',
                                            type: 'boolean',
                                          },
                                        },
                                        required: [
                                          'key',
                                        ],
                                        type: 'object',
                                        'x-kubernetes-map-type': 'atomic',
                                      },
                                      secret: {
                                        description: 'Secret containing data to use for the targets.',
                                        properties: {
                                          key: {
                                            description: 'The key of the secret to select from.  Must be a valid secret key.',
                                            type: 'string',
                                          },
                                          name: {
                                            default: '',
                                            description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                            type: 'string',
                                          },
                                          optional: {
                                            description: 'Specify whether the Secret or its key must be defined',
                                            type: 'boolean',
                                          },
                                        },
                                        required: [
                                          'key',
                                        ],
                                        type: 'object',
                                        'x-kubernetes-map-type': 'atomic',
                                      },
                                    },
                                    type: 'object',
                                  },
                                  insecureSkipVerify: {
                                    description: 'Disable target certificate validation.',
                                    type: 'boolean',
                                  },
                                  keySecret: {
                                    description: 'Secret containing the client key file for the targets.',
                                    properties: {
                                      key: {
                                        description: 'The key of the secret to select from.  Must be a valid secret key.',
                                        type: 'string',
                                      },
                                      name: {
                                        default: '',
                                        description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                        type: 'string',
                                      },
                                      optional: {
                                        description: 'Specify whether the Secret or its key must be defined',
                                        type: 'boolean',
                                      },
                                    },
                                    required: [
                                      'key',
                                    ],
                                    type: 'object',
                                    'x-kubernetes-map-type': 'atomic',
                                  },
                                  maxVersion: {
                                    description: 'Maximum acceptable TLS version.\n\nIt requires Prometheus >= v2.41.0.',
                                    enum: [
                                      'TLS10',
                                      'TLS11',
                                      'TLS12',
                                      'TLS13',
                                    ],
                                    type: 'string',
                                  },
                                  minVersion: {
                                    description: 'Minimum acceptable TLS version.\n\nIt requires Prometheus >= v2.35.0.',
                                    enum: [
                                      'TLS10',
                                      'TLS11',
                                      'TLS12',
                                      'TLS13',
                                    ],
                                    type: 'string',
                                  },
                                  serverName: {
                                    description: 'Used to verify the hostname for the targets.',
                                    type: 'string',
                                  },
                                },
                                type: 'object',
                              },
                            },
                            type: 'object',
                          },
                          sendResolved: {
                            description: 'Whether to notify about resolved alerts.',
                            type: 'boolean',
                          },
                          summary: {
                            description: 'Message summary template.\nIt requires Alertmanager >= 0.27.0.',
                            type: 'string',
                          },
                          text: {
                            description: 'Message body template.',
                            type: 'string',
                          },
                          title: {
                            description: 'Message title template.',
                            type: 'string',
                          },
                          webhookUrl: {
                            description: 'MSTeams webhook URL.',
                            properties: {
                              key: {
                                description: 'The key of the secret to select from.  Must be a valid secret key.',
                                type: 'string',
                              },
                              name: {
                                default: '',
                                description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                type: 'string',
                              },
                              optional: {
                                description: 'Specify whether the Secret or its key must be defined',
                                type: 'boolean',
                              },
                            },
                            required: [
                              'key',
                            ],
                            type: 'object',
                            'x-kubernetes-map-type': 'atomic',
                          },
                        },
                        required: [
                          'webhookUrl',
                        ],
                        type: 'object',
                      },
                      type: 'array',
                    },
                    name: {
                      description: 'Name of the receiver. Must be unique across all items from the list.',
                      minLength: 1,
                      type: 'string',
                    },
                    opsgenieConfigs: {
                      description: 'List of OpsGenie configurations.',
                      items: {
                        description: 'OpsGenieConfig configures notifications via OpsGenie.\nSee https://prometheus.io/docs/alerting/latest/configuration/#opsgenie_config',
                        properties: {
                          actions: {
                            description: 'Comma separated list of actions that will be available for the alert.',
                            type: 'string',
                          },
                          apiKey: {
                            description: "The secret's key that contains the OpsGenie API key.\nThe secret needs to be in the same namespace as the AlertmanagerConfig\nobject and accessible by the Prometheus Operator.",
                            properties: {
                              key: {
                                description: 'The key of the secret to select from.  Must be a valid secret key.',
                                minLength: 1,
                                type: 'string',
                              },
                              name: {
                                description: "The name of the secret in the object's namespace to select from.",
                                minLength: 1,
                                type: 'string',
                              },
                            },
                            required: [
                              'key',
                              'name',
                            ],
                            type: 'object',
                          },
                          apiURL: {
                            description: 'The URL to send OpsGenie API requests to.',
                            type: 'string',
                          },
                          description: {
                            description: 'Description of the incident.',
                            type: 'string',
                          },
                          details: {
                            description: 'A set of arbitrary key/value pairs that provide further detail about the incident.',
                            items: {
                              description: 'KeyValue defines a (key, value) tuple.',
                              properties: {
                                key: {
                                  description: 'Key of the tuple.',
                                  minLength: 1,
                                  type: 'string',
                                },
                                value: {
                                  description: 'Value of the tuple.',
                                  type: 'string',
                                },
                              },
                              required: [
                                'key',
                                'value',
                              ],
                              type: 'object',
                            },
                            type: 'array',
                          },
                          entity: {
                            description: 'Optional field that can be used to specify which domain alert is related to.',
                            type: 'string',
                          },
                          httpConfig: {
                            description: 'HTTP client configuration.',
                            properties: {
                              authorization: {
                                description: 'Authorization header configuration for the client.\nThis is mutually exclusive with BasicAuth and is only available starting from Alertmanager v0.22+.',
                                properties: {
                                  credentials: {
                                    description: 'Selects a key of a Secret in the namespace that contains the credentials for authentication.',
                                    properties: {
                                      key: {
                                        description: 'The key of the secret to select from.  Must be a valid secret key.',
                                        type: 'string',
                                      },
                                      name: {
                                        default: '',
                                        description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                        type: 'string',
                                      },
                                      optional: {
                                        description: 'Specify whether the Secret or its key must be defined',
                                        type: 'boolean',
                                      },
                                    },
                                    required: [
                                      'key',
                                    ],
                                    type: 'object',
                                    'x-kubernetes-map-type': 'atomic',
                                  },
                                  type: {
                                    description: 'Defines the authentication type. The value is case-insensitive.\n\n"Basic" is not a supported value.\n\nDefault: "Bearer"',
                                    type: 'string',
                                  },
                                },
                                type: 'object',
                              },
                              basicAuth: {
                                description: 'BasicAuth for the client.\nThis is mutually exclusive with Authorization. If both are defined, BasicAuth takes precedence.',
                                properties: {
                                  password: {
                                    description: '`password` specifies a key of a Secret containing the password for\nauthentication.',
                                    properties: {
                                      key: {
                                        description: 'The key of the secret to select from.  Must be a valid secret key.',
                                        type: 'string',
                                      },
                                      name: {
                                        default: '',
                                        description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                        type: 'string',
                                      },
                                      optional: {
                                        description: 'Specify whether the Secret or its key must be defined',
                                        type: 'boolean',
                                      },
                                    },
                                    required: [
                                      'key',
                                    ],
                                    type: 'object',
                                    'x-kubernetes-map-type': 'atomic',
                                  },
                                  username: {
                                    description: '`username` specifies a key of a Secret containing the username for\nauthentication.',
                                    properties: {
                                      key: {
                                        description: 'The key of the secret to select from.  Must be a valid secret key.',
                                        type: 'string',
                                      },
                                      name: {
                                        default: '',
                                        description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                        type: 'string',
                                      },
                                      optional: {
                                        description: 'Specify whether the Secret or its key must be defined',
                                        type: 'boolean',
                                      },
                                    },
                                    required: [
                                      'key',
                                    ],
                                    type: 'object',
                                    'x-kubernetes-map-type': 'atomic',
                                  },
                                },
                                type: 'object',
                              },
                              bearerTokenSecret: {
                                description: "The secret's key that contains the bearer token to be used by the client\nfor authentication.\nThe secret needs to be in the same namespace as the AlertmanagerConfig\nobject and accessible by the Prometheus Operator.",
                                properties: {
                                  key: {
                                    description: 'The key of the secret to select from.  Must be a valid secret key.',
                                    minLength: 1,
                                    type: 'string',
                                  },
                                  name: {
                                    description: "The name of the secret in the object's namespace to select from.",
                                    minLength: 1,
                                    type: 'string',
                                  },
                                },
                                required: [
                                  'key',
                                  'name',
                                ],
                                type: 'object',
                              },
                              followRedirects: {
                                description: 'FollowRedirects specifies whether the client should follow HTTP 3xx redirects.',
                                type: 'boolean',
                              },
                              noProxy: {
                                description: '`noProxy` is a comma-separated string that can contain IPs, CIDR notation, domain names\nthat should be excluded from proxying. IP and domain names can\ncontain port numbers.\n\nIt requires Prometheus >= v2.43.0 or Alertmanager >= 0.25.0.',
                                type: 'string',
                              },
                              oauth2: {
                                description: 'OAuth2 client credentials used to fetch a token for the targets.',
                                properties: {
                                  clientId: {
                                    description: "`clientId` specifies a key of a Secret or ConfigMap containing the\nOAuth2 client's ID.",
                                    properties: {
                                      configMap: {
                                        description: 'ConfigMap containing data to use for the targets.',
                                        properties: {
                                          key: {
                                            description: 'The key to select.',
                                            type: 'string',
                                          },
                                          name: {
                                            default: '',
                                            description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                            type: 'string',
                                          },
                                          optional: {
                                            description: 'Specify whether the ConfigMap or its key must be defined',
                                            type: 'boolean',
                                          },
                                        },
                                        required: [
                                          'key',
                                        ],
                                        type: 'object',
                                        'x-kubernetes-map-type': 'atomic',
                                      },
                                      secret: {
                                        description: 'Secret containing data to use for the targets.',
                                        properties: {
                                          key: {
                                            description: 'The key of the secret to select from.  Must be a valid secret key.',
                                            type: 'string',
                                          },
                                          name: {
                                            default: '',
                                            description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                            type: 'string',
                                          },
                                          optional: {
                                            description: 'Specify whether the Secret or its key must be defined',
                                            type: 'boolean',
                                          },
                                        },
                                        required: [
                                          'key',
                                        ],
                                        type: 'object',
                                        'x-kubernetes-map-type': 'atomic',
                                      },
                                    },
                                    type: 'object',
                                  },
                                  clientSecret: {
                                    description: "`clientSecret` specifies a key of a Secret containing the OAuth2\nclient's secret.",
                                    properties: {
                                      key: {
                                        description: 'The key of the secret to select from.  Must be a valid secret key.',
                                        type: 'string',
                                      },
                                      name: {
                                        default: '',
                                        description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                        type: 'string',
                                      },
                                      optional: {
                                        description: 'Specify whether the Secret or its key must be defined',
                                        type: 'boolean',
                                      },
                                    },
                                    required: [
                                      'key',
                                    ],
                                    type: 'object',
                                    'x-kubernetes-map-type': 'atomic',
                                  },
                                  endpointParams: {
                                    additionalProperties: {
                                      type: 'string',
                                    },
                                    description: '`endpointParams` configures the HTTP parameters to append to the token\nURL.',
                                    type: 'object',
                                  },
                                  noProxy: {
                                    description: '`noProxy` is a comma-separated string that can contain IPs, CIDR notation, domain names\nthat should be excluded from proxying. IP and domain names can\ncontain port numbers.\n\nIt requires Prometheus >= v2.43.0 or Alertmanager >= 0.25.0.',
                                    type: 'string',
                                  },
                                  proxyConnectHeader: {
                                    additionalProperties: {
                                      items: {
                                        description: 'SecretKeySelector selects a key of a Secret.',
                                        properties: {
                                          key: {
                                            description: 'The key of the secret to select from.  Must be a valid secret key.',
                                            type: 'string',
                                          },
                                          name: {
                                            default: '',
                                            description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                            type: 'string',
                                          },
                                          optional: {
                                            description: 'Specify whether the Secret or its key must be defined',
                                            type: 'boolean',
                                          },
                                        },
                                        required: [
                                          'key',
                                        ],
                                        type: 'object',
                                        'x-kubernetes-map-type': 'atomic',
                                      },
                                      type: 'array',
                                    },
                                    description: 'ProxyConnectHeader optionally specifies headers to send to\nproxies during CONNECT requests.\n\nIt requires Prometheus >= v2.43.0 or Alertmanager >= 0.25.0.',
                                    type: 'object',
                                    'x-kubernetes-map-type': 'atomic',
                                  },
                                  proxyFromEnvironment: {
                                    description: 'Whether to use the proxy configuration defined by environment variables (HTTP_PROXY, HTTPS_PROXY, and NO_PROXY).\n\nIt requires Prometheus >= v2.43.0 or Alertmanager >= 0.25.0.',
                                    type: 'boolean',
                                  },
                                  proxyUrl: {
                                    description: '`proxyURL` defines the HTTP proxy server to use.',
                                    pattern: '^http(s)?://.+$',
                                    type: 'string',
                                  },
                                  scopes: {
                                    description: '`scopes` defines the OAuth2 scopes used for the token request.',
                                    items: {
                                      type: 'string',
                                    },
                                    type: 'array',
                                  },
                                  tlsConfig: {
                                    description: 'TLS configuration to use when connecting to the OAuth2 server.\nIt requires Prometheus >= v2.43.0.',
                                    properties: {
                                      ca: {
                                        description: 'Certificate authority used when verifying server certificates.',
                                        properties: {
                                          configMap: {
                                            description: 'ConfigMap containing data to use for the targets.',
                                            properties: {
                                              key: {
                                                description: 'The key to select.',
                                                type: 'string',
                                              },
                                              name: {
                                                default: '',
                                                description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                                type: 'string',
                                              },
                                              optional: {
                                                description: 'Specify whether the ConfigMap or its key must be defined',
                                                type: 'boolean',
                                              },
                                            },
                                            required: [
                                              'key',
                                            ],
                                            type: 'object',
                                            'x-kubernetes-map-type': 'atomic',
                                          },
                                          secret: {
                                            description: 'Secret containing data to use for the targets.',
                                            properties: {
                                              key: {
                                                description: 'The key of the secret to select from.  Must be a valid secret key.',
                                                type: 'string',
                                              },
                                              name: {
                                                default: '',
                                                description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                                type: 'string',
                                              },
                                              optional: {
                                                description: 'Specify whether the Secret or its key must be defined',
                                                type: 'boolean',
                                              },
                                            },
                                            required: [
                                              'key',
                                            ],
                                            type: 'object',
                                            'x-kubernetes-map-type': 'atomic',
                                          },
                                        },
                                        type: 'object',
                                      },
                                      cert: {
                                        description: 'Client certificate to present when doing client-authentication.',
                                        properties: {
                                          configMap: {
                                            description: 'ConfigMap containing data to use for the targets.',
                                            properties: {
                                              key: {
                                                description: 'The key to select.',
                                                type: 'string',
                                              },
                                              name: {
                                                default: '',
                                                description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                                type: 'string',
                                              },
                                              optional: {
                                                description: 'Specify whether the ConfigMap or its key must be defined',
                                                type: 'boolean',
                                              },
                                            },
                                            required: [
                                              'key',
                                            ],
                                            type: 'object',
                                            'x-kubernetes-map-type': 'atomic',
                                          },
                                          secret: {
                                            description: 'Secret containing data to use for the targets.',
                                            properties: {
                                              key: {
                                                description: 'The key of the secret to select from.  Must be a valid secret key.',
                                                type: 'string',
                                              },
                                              name: {
                                                default: '',
                                                description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                                type: 'string',
                                              },
                                              optional: {
                                                description: 'Specify whether the Secret or its key must be defined',
                                                type: 'boolean',
                                              },
                                            },
                                            required: [
                                              'key',
                                            ],
                                            type: 'object',
                                            'x-kubernetes-map-type': 'atomic',
                                          },
                                        },
                                        type: 'object',
                                      },
                                      insecureSkipVerify: {
                                        description: 'Disable target certificate validation.',
                                        type: 'boolean',
                                      },
                                      keySecret: {
                                        description: 'Secret containing the client key file for the targets.',
                                        properties: {
                                          key: {
                                            description: 'The key of the secret to select from.  Must be a valid secret key.',
                                            type: 'string',
                                          },
                                          name: {
                                            default: '',
                                            description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                            type: 'string',
                                          },
                                          optional: {
                                            description: 'Specify whether the Secret or its key must be defined',
                                            type: 'boolean',
                                          },
                                        },
                                        required: [
                                          'key',
                                        ],
                                        type: 'object',
                                        'x-kubernetes-map-type': 'atomic',
                                      },
                                      maxVersion: {
                                        description: 'Maximum acceptable TLS version.\n\nIt requires Prometheus >= v2.41.0.',
                                        enum: [
                                          'TLS10',
                                          'TLS11',
                                          'TLS12',
                                          'TLS13',
                                        ],
                                        type: 'string',
                                      },
                                      minVersion: {
                                        description: 'Minimum acceptable TLS version.\n\nIt requires Prometheus >= v2.35.0.',
                                        enum: [
                                          'TLS10',
                                          'TLS11',
                                          'TLS12',
                                          'TLS13',
                                        ],
                                        type: 'string',
                                      },
                                      serverName: {
                                        description: 'Used to verify the hostname for the targets.',
                                        type: 'string',
                                      },
                                    },
                                    type: 'object',
                                  },
                                  tokenUrl: {
                                    description: '`tokenURL` configures the URL to fetch the token from.',
                                    minLength: 1,
                                    type: 'string',
                                  },
                                },
                                required: [
                                  'clientId',
                                  'clientSecret',
                                  'tokenUrl',
                                ],
                                type: 'object',
                              },
                              proxyConnectHeader: {
                                additionalProperties: {
                                  items: {
                                    description: 'SecretKeySelector selects a key of a Secret.',
                                    properties: {
                                      key: {
                                        description: 'The key of the secret to select from.  Must be a valid secret key.',
                                        type: 'string',
                                      },
                                      name: {
                                        default: '',
                                        description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                        type: 'string',
                                      },
                                      optional: {
                                        description: 'Specify whether the Secret or its key must be defined',
                                        type: 'boolean',
                                      },
                                    },
                                    required: [
                                      'key',
                                    ],
                                    type: 'object',
                                    'x-kubernetes-map-type': 'atomic',
                                  },
                                  type: 'array',
                                },
                                description: 'ProxyConnectHeader optionally specifies headers to send to\nproxies during CONNECT requests.\n\nIt requires Prometheus >= v2.43.0 or Alertmanager >= 0.25.0.',
                                type: 'object',
                                'x-kubernetes-map-type': 'atomic',
                              },
                              proxyFromEnvironment: {
                                description: 'Whether to use the proxy configuration defined by environment variables (HTTP_PROXY, HTTPS_PROXY, and NO_PROXY).\n\nIt requires Prometheus >= v2.43.0 or Alertmanager >= 0.25.0.',
                                type: 'boolean',
                              },
                              proxyURL: {
                                description: 'Optional proxy URL.\n\nIf defined, this field takes precedence over `proxyUrl`.',
                                type: 'string',
                              },
                              proxyUrl: {
                                description: '`proxyURL` defines the HTTP proxy server to use.',
                                pattern: '^http(s)?://.+$',
                                type: 'string',
                              },
                              tlsConfig: {
                                description: 'TLS configuration for the client.',
                                properties: {
                                  ca: {
                                    description: 'Certificate authority used when verifying server certificates.',
                                    properties: {
                                      configMap: {
                                        description: 'ConfigMap containing data to use for the targets.',
                                        properties: {
                                          key: {
                                            description: 'The key to select.',
                                            type: 'string',
                                          },
                                          name: {
                                            default: '',
                                            description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                            type: 'string',
                                          },
                                          optional: {
                                            description: 'Specify whether the ConfigMap or its key must be defined',
                                            type: 'boolean',
                                          },
                                        },
                                        required: [
                                          'key',
                                        ],
                                        type: 'object',
                                        'x-kubernetes-map-type': 'atomic',
                                      },
                                      secret: {
                                        description: 'Secret containing data to use for the targets.',
                                        properties: {
                                          key: {
                                            description: 'The key of the secret to select from.  Must be a valid secret key.',
                                            type: 'string',
                                          },
                                          name: {
                                            default: '',
                                            description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                            type: 'string',
                                          },
                                          optional: {
                                            description: 'Specify whether the Secret or its key must be defined',
                                            type: 'boolean',
                                          },
                                        },
                                        required: [
                                          'key',
                                        ],
                                        type: 'object',
                                        'x-kubernetes-map-type': 'atomic',
                                      },
                                    },
                                    type: 'object',
                                  },
                                  cert: {
                                    description: 'Client certificate to present when doing client-authentication.',
                                    properties: {
                                      configMap: {
                                        description: 'ConfigMap containing data to use for the targets.',
                                        properties: {
                                          key: {
                                            description: 'The key to select.',
                                            type: 'string',
                                          },
                                          name: {
                                            default: '',
                                            description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                            type: 'string',
                                          },
                                          optional: {
                                            description: 'Specify whether the ConfigMap or its key must be defined',
                                            type: 'boolean',
                                          },
                                        },
                                        required: [
                                          'key',
                                        ],
                                        type: 'object',
                                        'x-kubernetes-map-type': 'atomic',
                                      },
                                      secret: {
                                        description: 'Secret containing data to use for the targets.',
                                        properties: {
                                          key: {
                                            description: 'The key of the secret to select from.  Must be a valid secret key.',
                                            type: 'string',
                                          },
                                          name: {
                                            default: '',
                                            description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                            type: 'string',
                                          },
                                          optional: {
                                            description: 'Specify whether the Secret or its key must be defined',
                                            type: 'boolean',
                                          },
                                        },
                                        required: [
                                          'key',
                                        ],
                                        type: 'object',
                                        'x-kubernetes-map-type': 'atomic',
                                      },
                                    },
                                    type: 'object',
                                  },
                                  insecureSkipVerify: {
                                    description: 'Disable target certificate validation.',
                                    type: 'boolean',
                                  },
                                  keySecret: {
                                    description: 'Secret containing the client key file for the targets.',
                                    properties: {
                                      key: {
                                        description: 'The key of the secret to select from.  Must be a valid secret key.',
                                        type: 'string',
                                      },
                                      name: {
                                        default: '',
                                        description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                        type: 'string',
                                      },
                                      optional: {
                                        description: 'Specify whether the Secret or its key must be defined',
                                        type: 'boolean',
                                      },
                                    },
                                    required: [
                                      'key',
                                    ],
                                    type: 'object',
                                    'x-kubernetes-map-type': 'atomic',
                                  },
                                  maxVersion: {
                                    description: 'Maximum acceptable TLS version.\n\nIt requires Prometheus >= v2.41.0.',
                                    enum: [
                                      'TLS10',
                                      'TLS11',
                                      'TLS12',
                                      'TLS13',
                                    ],
                                    type: 'string',
                                  },
                                  minVersion: {
                                    description: 'Minimum acceptable TLS version.\n\nIt requires Prometheus >= v2.35.0.',
                                    enum: [
                                      'TLS10',
                                      'TLS11',
                                      'TLS12',
                                      'TLS13',
                                    ],
                                    type: 'string',
                                  },
                                  serverName: {
                                    description: 'Used to verify the hostname for the targets.',
                                    type: 'string',
                                  },
                                },
                                type: 'object',
                              },
                            },
                            type: 'object',
                          },
                          message: {
                            description: 'Alert text limited to 130 characters.',
                            type: 'string',
                          },
                          note: {
                            description: 'Additional alert note.',
                            type: 'string',
                          },
                          priority: {
                            description: 'Priority level of alert. Possible values are P1, P2, P3, P4, and P5.',
                            type: 'string',
                          },
                          responders: {
                            description: 'List of responders responsible for notifications.',
                            items: {
                              description: 'OpsGenieConfigResponder defines a responder to an incident.\nOne of `id`, `name` or `username` has to be defined.',
                              properties: {
                                id: {
                                  description: 'ID of the responder.',
                                  type: 'string',
                                },
                                name: {
                                  description: 'Name of the responder.',
                                  type: 'string',
                                },
                                type: {
                                  description: 'Type of responder.',
                                  enum: [
                                    'team',
                                    'teams',
                                    'user',
                                    'escalation',
                                    'schedule',
                                  ],
                                  minLength: 1,
                                  type: 'string',
                                },
                                username: {
                                  description: 'Username of the responder.',
                                  type: 'string',
                                },
                              },
                              required: [
                                'type',
                              ],
                              type: 'object',
                            },
                            type: 'array',
                          },
                          sendResolved: {
                            description: 'Whether or not to notify about resolved alerts.',
                            type: 'boolean',
                          },
                          source: {
                            description: 'Backlink to the sender of the notification.',
                            type: 'string',
                          },
                          tags: {
                            description: 'Comma separated list of tags attached to the notifications.',
                            type: 'string',
                          },
                        },
                        type: 'object',
                      },
                      type: 'array',
                    },
                    pagerdutyConfigs: {
                      description: 'List of PagerDuty configurations.',
                      items: {
                        description: 'PagerDutyConfig configures notifications via PagerDuty.\nSee https://prometheus.io/docs/alerting/latest/configuration/#pagerduty_config',
                        properties: {
                          class: {
                            description: 'The class/type of the event.',
                            type: 'string',
                          },
                          client: {
                            description: 'Client identification.',
                            type: 'string',
                          },
                          clientURL: {
                            description: 'Backlink to the sender of notification.',
                            type: 'string',
                          },
                          component: {
                            description: 'The part or component of the affected system that is broken.',
                            type: 'string',
                          },
                          description: {
                            description: 'Description of the incident.',
                            type: 'string',
                          },
                          details: {
                            description: 'Arbitrary key/value pairs that provide further detail about the incident.',
                            items: {
                              description: 'KeyValue defines a (key, value) tuple.',
                              properties: {
                                key: {
                                  description: 'Key of the tuple.',
                                  minLength: 1,
                                  type: 'string',
                                },
                                value: {
                                  description: 'Value of the tuple.',
                                  type: 'string',
                                },
                              },
                              required: [
                                'key',
                                'value',
                              ],
                              type: 'object',
                            },
                            type: 'array',
                          },
                          group: {
                            description: 'A cluster or grouping of sources.',
                            type: 'string',
                          },
                          httpConfig: {
                            description: 'HTTP client configuration.',
                            properties: {
                              authorization: {
                                description: 'Authorization header configuration for the client.\nThis is mutually exclusive with BasicAuth and is only available starting from Alertmanager v0.22+.',
                                properties: {
                                  credentials: {
                                    description: 'Selects a key of a Secret in the namespace that contains the credentials for authentication.',
                                    properties: {
                                      key: {
                                        description: 'The key of the secret to select from.  Must be a valid secret key.',
                                        type: 'string',
                                      },
                                      name: {
                                        default: '',
                                        description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                        type: 'string',
                                      },
                                      optional: {
                                        description: 'Specify whether the Secret or its key must be defined',
                                        type: 'boolean',
                                      },
                                    },
                                    required: [
                                      'key',
                                    ],
                                    type: 'object',
                                    'x-kubernetes-map-type': 'atomic',
                                  },
                                  type: {
                                    description: 'Defines the authentication type. The value is case-insensitive.\n\n"Basic" is not a supported value.\n\nDefault: "Bearer"',
                                    type: 'string',
                                  },
                                },
                                type: 'object',
                              },
                              basicAuth: {
                                description: 'BasicAuth for the client.\nThis is mutually exclusive with Authorization. If both are defined, BasicAuth takes precedence.',
                                properties: {
                                  password: {
                                    description: '`password` specifies a key of a Secret containing the password for\nauthentication.',
                                    properties: {
                                      key: {
                                        description: 'The key of the secret to select from.  Must be a valid secret key.',
                                        type: 'string',
                                      },
                                      name: {
                                        default: '',
                                        description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                        type: 'string',
                                      },
                                      optional: {
                                        description: 'Specify whether the Secret or its key must be defined',
                                        type: 'boolean',
                                      },
                                    },
                                    required: [
                                      'key',
                                    ],
                                    type: 'object',
                                    'x-kubernetes-map-type': 'atomic',
                                  },
                                  username: {
                                    description: '`username` specifies a key of a Secret containing the username for\nauthentication.',
                                    properties: {
                                      key: {
                                        description: 'The key of the secret to select from.  Must be a valid secret key.',
                                        type: 'string',
                                      },
                                      name: {
                                        default: '',
                                        description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                        type: 'string',
                                      },
                                      optional: {
                                        description: 'Specify whether the Secret or its key must be defined',
                                        type: 'boolean',
                                      },
                                    },
                                    required: [
                                      'key',
                                    ],
                                    type: 'object',
                                    'x-kubernetes-map-type': 'atomic',
                                  },
                                },
                                type: 'object',
                              },
                              bearerTokenSecret: {
                                description: "The secret's key that contains the bearer token to be used by the client\nfor authentication.\nThe secret needs to be in the same namespace as the AlertmanagerConfig\nobject and accessible by the Prometheus Operator.",
                                properties: {
                                  key: {
                                    description: 'The key of the secret to select from.  Must be a valid secret key.',
                                    minLength: 1,
                                    type: 'string',
                                  },
                                  name: {
                                    description: "The name of the secret in the object's namespace to select from.",
                                    minLength: 1,
                                    type: 'string',
                                  },
                                },
                                required: [
                                  'key',
                                  'name',
                                ],
                                type: 'object',
                              },
                              followRedirects: {
                                description: 'FollowRedirects specifies whether the client should follow HTTP 3xx redirects.',
                                type: 'boolean',
                              },
                              noProxy: {
                                description: '`noProxy` is a comma-separated string that can contain IPs, CIDR notation, domain names\nthat should be excluded from proxying. IP and domain names can\ncontain port numbers.\n\nIt requires Prometheus >= v2.43.0 or Alertmanager >= 0.25.0.',
                                type: 'string',
                              },
                              oauth2: {
                                description: 'OAuth2 client credentials used to fetch a token for the targets.',
                                properties: {
                                  clientId: {
                                    description: "`clientId` specifies a key of a Secret or ConfigMap containing the\nOAuth2 client's ID.",
                                    properties: {
                                      configMap: {
                                        description: 'ConfigMap containing data to use for the targets.',
                                        properties: {
                                          key: {
                                            description: 'The key to select.',
                                            type: 'string',
                                          },
                                          name: {
                                            default: '',
                                            description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                            type: 'string',
                                          },
                                          optional: {
                                            description: 'Specify whether the ConfigMap or its key must be defined',
                                            type: 'boolean',
                                          },
                                        },
                                        required: [
                                          'key',
                                        ],
                                        type: 'object',
                                        'x-kubernetes-map-type': 'atomic',
                                      },
                                      secret: {
                                        description: 'Secret containing data to use for the targets.',
                                        properties: {
                                          key: {
                                            description: 'The key of the secret to select from.  Must be a valid secret key.',
                                            type: 'string',
                                          },
                                          name: {
                                            default: '',
                                            description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                            type: 'string',
                                          },
                                          optional: {
                                            description: 'Specify whether the Secret or its key must be defined',
                                            type: 'boolean',
                                          },
                                        },
                                        required: [
                                          'key',
                                        ],
                                        type: 'object',
                                        'x-kubernetes-map-type': 'atomic',
                                      },
                                    },
                                    type: 'object',
                                  },
                                  clientSecret: {
                                    description: "`clientSecret` specifies a key of a Secret containing the OAuth2\nclient's secret.",
                                    properties: {
                                      key: {
                                        description: 'The key of the secret to select from.  Must be a valid secret key.',
                                        type: 'string',
                                      },
                                      name: {
                                        default: '',
                                        description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                        type: 'string',
                                      },
                                      optional: {
                                        description: 'Specify whether the Secret or its key must be defined',
                                        type: 'boolean',
                                      },
                                    },
                                    required: [
                                      'key',
                                    ],
                                    type: 'object',
                                    'x-kubernetes-map-type': 'atomic',
                                  },
                                  endpointParams: {
                                    additionalProperties: {
                                      type: 'string',
                                    },
                                    description: '`endpointParams` configures the HTTP parameters to append to the token\nURL.',
                                    type: 'object',
                                  },
                                  noProxy: {
                                    description: '`noProxy` is a comma-separated string that can contain IPs, CIDR notation, domain names\nthat should be excluded from proxying. IP and domain names can\ncontain port numbers.\n\nIt requires Prometheus >= v2.43.0 or Alertmanager >= 0.25.0.',
                                    type: 'string',
                                  },
                                  proxyConnectHeader: {
                                    additionalProperties: {
                                      items: {
                                        description: 'SecretKeySelector selects a key of a Secret.',
                                        properties: {
                                          key: {
                                            description: 'The key of the secret to select from.  Must be a valid secret key.',
                                            type: 'string',
                                          },
                                          name: {
                                            default: '',
                                            description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                            type: 'string',
                                          },
                                          optional: {
                                            description: 'Specify whether the Secret or its key must be defined',
                                            type: 'boolean',
                                          },
                                        },
                                        required: [
                                          'key',
                                        ],
                                        type: 'object',
                                        'x-kubernetes-map-type': 'atomic',
                                      },
                                      type: 'array',
                                    },
                                    description: 'ProxyConnectHeader optionally specifies headers to send to\nproxies during CONNECT requests.\n\nIt requires Prometheus >= v2.43.0 or Alertmanager >= 0.25.0.',
                                    type: 'object',
                                    'x-kubernetes-map-type': 'atomic',
                                  },
                                  proxyFromEnvironment: {
                                    description: 'Whether to use the proxy configuration defined by environment variables (HTTP_PROXY, HTTPS_PROXY, and NO_PROXY).\n\nIt requires Prometheus >= v2.43.0 or Alertmanager >= 0.25.0.',
                                    type: 'boolean',
                                  },
                                  proxyUrl: {
                                    description: '`proxyURL` defines the HTTP proxy server to use.',
                                    pattern: '^http(s)?://.+$',
                                    type: 'string',
                                  },
                                  scopes: {
                                    description: '`scopes` defines the OAuth2 scopes used for the token request.',
                                    items: {
                                      type: 'string',
                                    },
                                    type: 'array',
                                  },
                                  tlsConfig: {
                                    description: 'TLS configuration to use when connecting to the OAuth2 server.\nIt requires Prometheus >= v2.43.0.',
                                    properties: {
                                      ca: {
                                        description: 'Certificate authority used when verifying server certificates.',
                                        properties: {
                                          configMap: {
                                            description: 'ConfigMap containing data to use for the targets.',
                                            properties: {
                                              key: {
                                                description: 'The key to select.',
                                                type: 'string',
                                              },
                                              name: {
                                                default: '',
                                                description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                                type: 'string',
                                              },
                                              optional: {
                                                description: 'Specify whether the ConfigMap or its key must be defined',
                                                type: 'boolean',
                                              },
                                            },
                                            required: [
                                              'key',
                                            ],
                                            type: 'object',
                                            'x-kubernetes-map-type': 'atomic',
                                          },
                                          secret: {
                                            description: 'Secret containing data to use for the targets.',
                                            properties: {
                                              key: {
                                                description: 'The key of the secret to select from.  Must be a valid secret key.',
                                                type: 'string',
                                              },
                                              name: {
                                                default: '',
                                                description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                                type: 'string',
                                              },
                                              optional: {
                                                description: 'Specify whether the Secret or its key must be defined',
                                                type: 'boolean',
                                              },
                                            },
                                            required: [
                                              'key',
                                            ],
                                            type: 'object',
                                            'x-kubernetes-map-type': 'atomic',
                                          },
                                        },
                                        type: 'object',
                                      },
                                      cert: {
                                        description: 'Client certificate to present when doing client-authentication.',
                                        properties: {
                                          configMap: {
                                            description: 'ConfigMap containing data to use for the targets.',
                                            properties: {
                                              key: {
                                                description: 'The key to select.',
                                                type: 'string',
                                              },
                                              name: {
                                                default: '',
                                                description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                                type: 'string',
                                              },
                                              optional: {
                                                description: 'Specify whether the ConfigMap or its key must be defined',
                                                type: 'boolean',
                                              },
                                            },
                                            required: [
                                              'key',
                                            ],
                                            type: 'object',
                                            'x-kubernetes-map-type': 'atomic',
                                          },
                                          secret: {
                                            description: 'Secret containing data to use for the targets.',
                                            properties: {
                                              key: {
                                                description: 'The key of the secret to select from.  Must be a valid secret key.',
                                                type: 'string',
                                              },
                                              name: {
                                                default: '',
                                                description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                                type: 'string',
                                              },
                                              optional: {
                                                description: 'Specify whether the Secret or its key must be defined',
                                                type: 'boolean',
                                              },
                                            },
                                            required: [
                                              'key',
                                            ],
                                            type: 'object',
                                            'x-kubernetes-map-type': 'atomic',
                                          },
                                        },
                                        type: 'object',
                                      },
                                      insecureSkipVerify: {
                                        description: 'Disable target certificate validation.',
                                        type: 'boolean',
                                      },
                                      keySecret: {
                                        description: 'Secret containing the client key file for the targets.',
                                        properties: {
                                          key: {
                                            description: 'The key of the secret to select from.  Must be a valid secret key.',
                                            type: 'string',
                                          },
                                          name: {
                                            default: '',
                                            description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                            type: 'string',
                                          },
                                          optional: {
                                            description: 'Specify whether the Secret or its key must be defined',
                                            type: 'boolean',
                                          },
                                        },
                                        required: [
                                          'key',
                                        ],
                                        type: 'object',
                                        'x-kubernetes-map-type': 'atomic',
                                      },
                                      maxVersion: {
                                        description: 'Maximum acceptable TLS version.\n\nIt requires Prometheus >= v2.41.0.',
                                        enum: [
                                          'TLS10',
                                          'TLS11',
                                          'TLS12',
                                          'TLS13',
                                        ],
                                        type: 'string',
                                      },
                                      minVersion: {
                                        description: 'Minimum acceptable TLS version.\n\nIt requires Prometheus >= v2.35.0.',
                                        enum: [
                                          'TLS10',
                                          'TLS11',
                                          'TLS12',
                                          'TLS13',
                                        ],
                                        type: 'string',
                                      },
                                      serverName: {
                                        description: 'Used to verify the hostname for the targets.',
                                        type: 'string',
                                      },
                                    },
                                    type: 'object',
                                  },
                                  tokenUrl: {
                                    description: '`tokenURL` configures the URL to fetch the token from.',
                                    minLength: 1,
                                    type: 'string',
                                  },
                                },
                                required: [
                                  'clientId',
                                  'clientSecret',
                                  'tokenUrl',
                                ],
                                type: 'object',
                              },
                              proxyConnectHeader: {
                                additionalProperties: {
                                  items: {
                                    description: 'SecretKeySelector selects a key of a Secret.',
                                    properties: {
                                      key: {
                                        description: 'The key of the secret to select from.  Must be a valid secret key.',
                                        type: 'string',
                                      },
                                      name: {
                                        default: '',
                                        description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                        type: 'string',
                                      },
                                      optional: {
                                        description: 'Specify whether the Secret or its key must be defined',
                                        type: 'boolean',
                                      },
                                    },
                                    required: [
                                      'key',
                                    ],
                                    type: 'object',
                                    'x-kubernetes-map-type': 'atomic',
                                  },
                                  type: 'array',
                                },
                                description: 'ProxyConnectHeader optionally specifies headers to send to\nproxies during CONNECT requests.\n\nIt requires Prometheus >= v2.43.0 or Alertmanager >= 0.25.0.',
                                type: 'object',
                                'x-kubernetes-map-type': 'atomic',
                              },
                              proxyFromEnvironment: {
                                description: 'Whether to use the proxy configuration defined by environment variables (HTTP_PROXY, HTTPS_PROXY, and NO_PROXY).\n\nIt requires Prometheus >= v2.43.0 or Alertmanager >= 0.25.0.',
                                type: 'boolean',
                              },
                              proxyURL: {
                                description: 'Optional proxy URL.\n\nIf defined, this field takes precedence over `proxyUrl`.',
                                type: 'string',
                              },
                              proxyUrl: {
                                description: '`proxyURL` defines the HTTP proxy server to use.',
                                pattern: '^http(s)?://.+$',
                                type: 'string',
                              },
                              tlsConfig: {
                                description: 'TLS configuration for the client.',
                                properties: {
                                  ca: {
                                    description: 'Certificate authority used when verifying server certificates.',
                                    properties: {
                                      configMap: {
                                        description: 'ConfigMap containing data to use for the targets.',
                                        properties: {
                                          key: {
                                            description: 'The key to select.',
                                            type: 'string',
                                          },
                                          name: {
                                            default: '',
                                            description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                            type: 'string',
                                          },
                                          optional: {
                                            description: 'Specify whether the ConfigMap or its key must be defined',
                                            type: 'boolean',
                                          },
                                        },
                                        required: [
                                          'key',
                                        ],
                                        type: 'object',
                                        'x-kubernetes-map-type': 'atomic',
                                      },
                                      secret: {
                                        description: 'Secret containing data to use for the targets.',
                                        properties: {
                                          key: {
                                            description: 'The key of the secret to select from.  Must be a valid secret key.',
                                            type: 'string',
                                          },
                                          name: {
                                            default: '',
                                            description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                            type: 'string',
                                          },
                                          optional: {
                                            description: 'Specify whether the Secret or its key must be defined',
                                            type: 'boolean',
                                          },
                                        },
                                        required: [
                                          'key',
                                        ],
                                        type: 'object',
                                        'x-kubernetes-map-type': 'atomic',
                                      },
                                    },
                                    type: 'object',
                                  },
                                  cert: {
                                    description: 'Client certificate to present when doing client-authentication.',
                                    properties: {
                                      configMap: {
                                        description: 'ConfigMap containing data to use for the targets.',
                                        properties: {
                                          key: {
                                            description: 'The key to select.',
                                            type: 'string',
                                          },
                                          name: {
                                            default: '',
                                            description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                            type: 'string',
                                          },
                                          optional: {
                                            description: 'Specify whether the ConfigMap or its key must be defined',
                                            type: 'boolean',
                                          },
                                        },
                                        required: [
                                          'key',
                                        ],
                                        type: 'object',
                                        'x-kubernetes-map-type': 'atomic',
                                      },
                                      secret: {
                                        description: 'Secret containing data to use for the targets.',
                                        properties: {
                                          key: {
                                            description: 'The key of the secret to select from.  Must be a valid secret key.',
                                            type: 'string',
                                          },
                                          name: {
                                            default: '',
                                            description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                            type: 'string',
                                          },
                                          optional: {
                                            description: 'Specify whether the Secret or its key must be defined',
                                            type: 'boolean',
                                          },
                                        },
                                        required: [
                                          'key',
                                        ],
                                        type: 'object',
                                        'x-kubernetes-map-type': 'atomic',
                                      },
                                    },
                                    type: 'object',
                                  },
                                  insecureSkipVerify: {
                                    description: 'Disable target certificate validation.',
                                    type: 'boolean',
                                  },
                                  keySecret: {
                                    description: 'Secret containing the client key file for the targets.',
                                    properties: {
                                      key: {
                                        description: 'The key of the secret to select from.  Must be a valid secret key.',
                                        type: 'string',
                                      },
                                      name: {
                                        default: '',
                                        description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                        type: 'string',
                                      },
                                      optional: {
                                        description: 'Specify whether the Secret or its key must be defined',
                                        type: 'boolean',
                                      },
                                    },
                                    required: [
                                      'key',
                                    ],
                                    type: 'object',
                                    'x-kubernetes-map-type': 'atomic',
                                  },
                                  maxVersion: {
                                    description: 'Maximum acceptable TLS version.\n\nIt requires Prometheus >= v2.41.0.',
                                    enum: [
                                      'TLS10',
                                      'TLS11',
                                      'TLS12',
                                      'TLS13',
                                    ],
                                    type: 'string',
                                  },
                                  minVersion: {
                                    description: 'Minimum acceptable TLS version.\n\nIt requires Prometheus >= v2.35.0.',
                                    enum: [
                                      'TLS10',
                                      'TLS11',
                                      'TLS12',
                                      'TLS13',
                                    ],
                                    type: 'string',
                                  },
                                  serverName: {
                                    description: 'Used to verify the hostname for the targets.',
                                    type: 'string',
                                  },
                                },
                                type: 'object',
                              },
                            },
                            type: 'object',
                          },
                          pagerDutyImageConfigs: {
                            description: 'A list of image details to attach that provide further detail about an incident.',
                            items: {
                              description: 'PagerDutyImageConfig attaches images to an incident',
                              properties: {
                                alt: {
                                  description: 'Alt is the optional alternative text for the image.',
                                  type: 'string',
                                },
                                href: {
                                  description: 'Optional URL; makes the image a clickable link.',
                                  type: 'string',
                                },
                                src: {
                                  description: 'Src of the image being attached to the incident',
                                  type: 'string',
                                },
                              },
                              type: 'object',
                            },
                            type: 'array',
                          },
                          pagerDutyLinkConfigs: {
                            description: 'A list of link details to attach that provide further detail about an incident.',
                            items: {
                              description: 'PagerDutyLinkConfig attaches text links to an incident',
                              properties: {
                                alt: {
                                  description: "Text that describes the purpose of the link, and can be used as the link's text.",
                                  type: 'string',
                                },
                                href: {
                                  description: 'Href is the URL of the link to be attached',
                                  type: 'string',
                                },
                              },
                              type: 'object',
                            },
                            type: 'array',
                          },
                          routingKey: {
                            description: "The secret's key that contains the PagerDuty integration key (when using\nEvents API v2). Either this field or `serviceKey` needs to be defined.\nThe secret needs to be in the same namespace as the AlertmanagerConfig\nobject and accessible by the Prometheus Operator.",
                            properties: {
                              key: {
                                description: 'The key of the secret to select from.  Must be a valid secret key.',
                                minLength: 1,
                                type: 'string',
                              },
                              name: {
                                description: "The name of the secret in the object's namespace to select from.",
                                minLength: 1,
                                type: 'string',
                              },
                            },
                            required: [
                              'key',
                              'name',
                            ],
                            type: 'object',
                          },
                          sendResolved: {
                            description: 'Whether or not to notify about resolved alerts.',
                            type: 'boolean',
                          },
                          serviceKey: {
                            description: "The secret's key that contains the PagerDuty service key (when using\nintegration type \"Prometheus\"). Either this field or `routingKey` needs to\nbe defined.\nThe secret needs to be in the same namespace as the AlertmanagerConfig\nobject and accessible by the Prometheus Operator.",
                            properties: {
                              key: {
                                description: 'The key of the secret to select from.  Must be a valid secret key.',
                                minLength: 1,
                                type: 'string',
                              },
                              name: {
                                description: "The name of the secret in the object's namespace to select from.",
                                minLength: 1,
                                type: 'string',
                              },
                            },
                            required: [
                              'key',
                              'name',
                            ],
                            type: 'object',
                          },
                          severity: {
                            description: 'Severity of the incident.',
                            type: 'string',
                          },
                          source: {
                            description: 'Unique location of the affected system.',
                            type: 'string',
                          },
                          url: {
                            description: 'The URL to send requests to.',
                            type: 'string',
                          },
                        },
                        type: 'object',
                      },
                      type: 'array',
                    },
                    pushoverConfigs: {
                      description: 'List of Pushover configurations.',
                      items: {
                        description: 'PushoverConfig configures notifications via Pushover.\nSee https://prometheus.io/docs/alerting/latest/configuration/#pushover_config',
                        properties: {
                          device: {
                            description: 'The name of a device to send the notification to',
                            type: 'string',
                          },
                          expire: {
                            description: 'How long your notification will continue to be retried for, unless the user\nacknowledges the notification.',
                            pattern: '^(([0-9]+)y)?(([0-9]+)w)?(([0-9]+)d)?(([0-9]+)h)?(([0-9]+)m)?(([0-9]+)s)?(([0-9]+)ms)?$',
                            type: 'string',
                          },
                          html: {
                            description: 'Whether notification message is HTML or plain text.',
                            type: 'boolean',
                          },
                          httpConfig: {
                            description: 'HTTP client configuration.',
                            properties: {
                              authorization: {
                                description: 'Authorization header configuration for the client.\nThis is mutually exclusive with BasicAuth and is only available starting from Alertmanager v0.22+.',
                                properties: {
                                  credentials: {
                                    description: 'Selects a key of a Secret in the namespace that contains the credentials for authentication.',
                                    properties: {
                                      key: {
                                        description: 'The key of the secret to select from.  Must be a valid secret key.',
                                        type: 'string',
                                      },
                                      name: {
                                        default: '',
                                        description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                        type: 'string',
                                      },
                                      optional: {
                                        description: 'Specify whether the Secret or its key must be defined',
                                        type: 'boolean',
                                      },
                                    },
                                    required: [
                                      'key',
                                    ],
                                    type: 'object',
                                    'x-kubernetes-map-type': 'atomic',
                                  },
                                  type: {
                                    description: 'Defines the authentication type. The value is case-insensitive.\n\n"Basic" is not a supported value.\n\nDefault: "Bearer"',
                                    type: 'string',
                                  },
                                },
                                type: 'object',
                              },
                              basicAuth: {
                                description: 'BasicAuth for the client.\nThis is mutually exclusive with Authorization. If both are defined, BasicAuth takes precedence.',
                                properties: {
                                  password: {
                                    description: '`password` specifies a key of a Secret containing the password for\nauthentication.',
                                    properties: {
                                      key: {
                                        description: 'The key of the secret to select from.  Must be a valid secret key.',
                                        type: 'string',
                                      },
                                      name: {
                                        default: '',
                                        description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                        type: 'string',
                                      },
                                      optional: {
                                        description: 'Specify whether the Secret or its key must be defined',
                                        type: 'boolean',
                                      },
                                    },
                                    required: [
                                      'key',
                                    ],
                                    type: 'object',
                                    'x-kubernetes-map-type': 'atomic',
                                  },
                                  username: {
                                    description: '`username` specifies a key of a Secret containing the username for\nauthentication.',
                                    properties: {
                                      key: {
                                        description: 'The key of the secret to select from.  Must be a valid secret key.',
                                        type: 'string',
                                      },
                                      name: {
                                        default: '',
                                        description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                        type: 'string',
                                      },
                                      optional: {
                                        description: 'Specify whether the Secret or its key must be defined',
                                        type: 'boolean',
                                      },
                                    },
                                    required: [
                                      'key',
                                    ],
                                    type: 'object',
                                    'x-kubernetes-map-type': 'atomic',
                                  },
                                },
                                type: 'object',
                              },
                              bearerTokenSecret: {
                                description: "The secret's key that contains the bearer token to be used by the client\nfor authentication.\nThe secret needs to be in the same namespace as the AlertmanagerConfig\nobject and accessible by the Prometheus Operator.",
                                properties: {
                                  key: {
                                    description: 'The key of the secret to select from.  Must be a valid secret key.',
                                    minLength: 1,
                                    type: 'string',
                                  },
                                  name: {
                                    description: "The name of the secret in the object's namespace to select from.",
                                    minLength: 1,
                                    type: 'string',
                                  },
                                },
                                required: [
                                  'key',
                                  'name',
                                ],
                                type: 'object',
                              },
                              followRedirects: {
                                description: 'FollowRedirects specifies whether the client should follow HTTP 3xx redirects.',
                                type: 'boolean',
                              },
                              noProxy: {
                                description: '`noProxy` is a comma-separated string that can contain IPs, CIDR notation, domain names\nthat should be excluded from proxying. IP and domain names can\ncontain port numbers.\n\nIt requires Prometheus >= v2.43.0 or Alertmanager >= 0.25.0.',
                                type: 'string',
                              },
                              oauth2: {
                                description: 'OAuth2 client credentials used to fetch a token for the targets.',
                                properties: {
                                  clientId: {
                                    description: "`clientId` specifies a key of a Secret or ConfigMap containing the\nOAuth2 client's ID.",
                                    properties: {
                                      configMap: {
                                        description: 'ConfigMap containing data to use for the targets.',
                                        properties: {
                                          key: {
                                            description: 'The key to select.',
                                            type: 'string',
                                          },
                                          name: {
                                            default: '',
                                            description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                            type: 'string',
                                          },
                                          optional: {
                                            description: 'Specify whether the ConfigMap or its key must be defined',
                                            type: 'boolean',
                                          },
                                        },
                                        required: [
                                          'key',
                                        ],
                                        type: 'object',
                                        'x-kubernetes-map-type': 'atomic',
                                      },
                                      secret: {
                                        description: 'Secret containing data to use for the targets.',
                                        properties: {
                                          key: {
                                            description: 'The key of the secret to select from.  Must be a valid secret key.',
                                            type: 'string',
                                          },
                                          name: {
                                            default: '',
                                            description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                            type: 'string',
                                          },
                                          optional: {
                                            description: 'Specify whether the Secret or its key must be defined',
                                            type: 'boolean',
                                          },
                                        },
                                        required: [
                                          'key',
                                        ],
                                        type: 'object',
                                        'x-kubernetes-map-type': 'atomic',
                                      },
                                    },
                                    type: 'object',
                                  },
                                  clientSecret: {
                                    description: "`clientSecret` specifies a key of a Secret containing the OAuth2\nclient's secret.",
                                    properties: {
                                      key: {
                                        description: 'The key of the secret to select from.  Must be a valid secret key.',
                                        type: 'string',
                                      },
                                      name: {
                                        default: '',
                                        description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                        type: 'string',
                                      },
                                      optional: {
                                        description: 'Specify whether the Secret or its key must be defined',
                                        type: 'boolean',
                                      },
                                    },
                                    required: [
                                      'key',
                                    ],
                                    type: 'object',
                                    'x-kubernetes-map-type': 'atomic',
                                  },
                                  endpointParams: {
                                    additionalProperties: {
                                      type: 'string',
                                    },
                                    description: '`endpointParams` configures the HTTP parameters to append to the token\nURL.',
                                    type: 'object',
                                  },
                                  noProxy: {
                                    description: '`noProxy` is a comma-separated string that can contain IPs, CIDR notation, domain names\nthat should be excluded from proxying. IP and domain names can\ncontain port numbers.\n\nIt requires Prometheus >= v2.43.0 or Alertmanager >= 0.25.0.',
                                    type: 'string',
                                  },
                                  proxyConnectHeader: {
                                    additionalProperties: {
                                      items: {
                                        description: 'SecretKeySelector selects a key of a Secret.',
                                        properties: {
                                          key: {
                                            description: 'The key of the secret to select from.  Must be a valid secret key.',
                                            type: 'string',
                                          },
                                          name: {
                                            default: '',
                                            description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                            type: 'string',
                                          },
                                          optional: {
                                            description: 'Specify whether the Secret or its key must be defined',
                                            type: 'boolean',
                                          },
                                        },
                                        required: [
                                          'key',
                                        ],
                                        type: 'object',
                                        'x-kubernetes-map-type': 'atomic',
                                      },
                                      type: 'array',
                                    },
                                    description: 'ProxyConnectHeader optionally specifies headers to send to\nproxies during CONNECT requests.\n\nIt requires Prometheus >= v2.43.0 or Alertmanager >= 0.25.0.',
                                    type: 'object',
                                    'x-kubernetes-map-type': 'atomic',
                                  },
                                  proxyFromEnvironment: {
                                    description: 'Whether to use the proxy configuration defined by environment variables (HTTP_PROXY, HTTPS_PROXY, and NO_PROXY).\n\nIt requires Prometheus >= v2.43.0 or Alertmanager >= 0.25.0.',
                                    type: 'boolean',
                                  },
                                  proxyUrl: {
                                    description: '`proxyURL` defines the HTTP proxy server to use.',
                                    pattern: '^http(s)?://.+$',
                                    type: 'string',
                                  },
                                  scopes: {
                                    description: '`scopes` defines the OAuth2 scopes used for the token request.',
                                    items: {
                                      type: 'string',
                                    },
                                    type: 'array',
                                  },
                                  tlsConfig: {
                                    description: 'TLS configuration to use when connecting to the OAuth2 server.\nIt requires Prometheus >= v2.43.0.',
                                    properties: {
                                      ca: {
                                        description: 'Certificate authority used when verifying server certificates.',
                                        properties: {
                                          configMap: {
                                            description: 'ConfigMap containing data to use for the targets.',
                                            properties: {
                                              key: {
                                                description: 'The key to select.',
                                                type: 'string',
                                              },
                                              name: {
                                                default: '',
                                                description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                                type: 'string',
                                              },
                                              optional: {
                                                description: 'Specify whether the ConfigMap or its key must be defined',
                                                type: 'boolean',
                                              },
                                            },
                                            required: [
                                              'key',
                                            ],
                                            type: 'object',
                                            'x-kubernetes-map-type': 'atomic',
                                          },
                                          secret: {
                                            description: 'Secret containing data to use for the targets.',
                                            properties: {
                                              key: {
                                                description: 'The key of the secret to select from.  Must be a valid secret key.',
                                                type: 'string',
                                              },
                                              name: {
                                                default: '',
                                                description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                                type: 'string',
                                              },
                                              optional: {
                                                description: 'Specify whether the Secret or its key must be defined',
                                                type: 'boolean',
                                              },
                                            },
                                            required: [
                                              'key',
                                            ],
                                            type: 'object',
                                            'x-kubernetes-map-type': 'atomic',
                                          },
                                        },
                                        type: 'object',
                                      },
                                      cert: {
                                        description: 'Client certificate to present when doing client-authentication.',
                                        properties: {
                                          configMap: {
                                            description: 'ConfigMap containing data to use for the targets.',
                                            properties: {
                                              key: {
                                                description: 'The key to select.',
                                                type: 'string',
                                              },
                                              name: {
                                                default: '',
                                                description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                                type: 'string',
                                              },
                                              optional: {
                                                description: 'Specify whether the ConfigMap or its key must be defined',
                                                type: 'boolean',
                                              },
                                            },
                                            required: [
                                              'key',
                                            ],
                                            type: 'object',
                                            'x-kubernetes-map-type': 'atomic',
                                          },
                                          secret: {
                                            description: 'Secret containing data to use for the targets.',
                                            properties: {
                                              key: {
                                                description: 'The key of the secret to select from.  Must be a valid secret key.',
                                                type: 'string',
                                              },
                                              name: {
                                                default: '',
                                                description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                                type: 'string',
                                              },
                                              optional: {
                                                description: 'Specify whether the Secret or its key must be defined',
                                                type: 'boolean',
                                              },
                                            },
                                            required: [
                                              'key',
                                            ],
                                            type: 'object',
                                            'x-kubernetes-map-type': 'atomic',
                                          },
                                        },
                                        type: 'object',
                                      },
                                      insecureSkipVerify: {
                                        description: 'Disable target certificate validation.',
                                        type: 'boolean',
                                      },
                                      keySecret: {
                                        description: 'Secret containing the client key file for the targets.',
                                        properties: {
                                          key: {
                                            description: 'The key of the secret to select from.  Must be a valid secret key.',
                                            type: 'string',
                                          },
                                          name: {
                                            default: '',
                                            description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                            type: 'string',
                                          },
                                          optional: {
                                            description: 'Specify whether the Secret or its key must be defined',
                                            type: 'boolean',
                                          },
                                        },
                                        required: [
                                          'key',
                                        ],
                                        type: 'object',
                                        'x-kubernetes-map-type': 'atomic',
                                      },
                                      maxVersion: {
                                        description: 'Maximum acceptable TLS version.\n\nIt requires Prometheus >= v2.41.0.',
                                        enum: [
                                          'TLS10',
                                          'TLS11',
                                          'TLS12',
                                          'TLS13',
                                        ],
                                        type: 'string',
                                      },
                                      minVersion: {
                                        description: 'Minimum acceptable TLS version.\n\nIt requires Prometheus >= v2.35.0.',
                                        enum: [
                                          'TLS10',
                                          'TLS11',
                                          'TLS12',
                                          'TLS13',
                                        ],
                                        type: 'string',
                                      },
                                      serverName: {
                                        description: 'Used to verify the hostname for the targets.',
                                        type: 'string',
                                      },
                                    },
                                    type: 'object',
                                  },
                                  tokenUrl: {
                                    description: '`tokenURL` configures the URL to fetch the token from.',
                                    minLength: 1,
                                    type: 'string',
                                  },
                                },
                                required: [
                                  'clientId',
                                  'clientSecret',
                                  'tokenUrl',
                                ],
                                type: 'object',
                              },
                              proxyConnectHeader: {
                                additionalProperties: {
                                  items: {
                                    description: 'SecretKeySelector selects a key of a Secret.',
                                    properties: {
                                      key: {
                                        description: 'The key of the secret to select from.  Must be a valid secret key.',
                                        type: 'string',
                                      },
                                      name: {
                                        default: '',
                                        description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                        type: 'string',
                                      },
                                      optional: {
                                        description: 'Specify whether the Secret or its key must be defined',
                                        type: 'boolean',
                                      },
                                    },
                                    required: [
                                      'key',
                                    ],
                                    type: 'object',
                                    'x-kubernetes-map-type': 'atomic',
                                  },
                                  type: 'array',
                                },
                                description: 'ProxyConnectHeader optionally specifies headers to send to\nproxies during CONNECT requests.\n\nIt requires Prometheus >= v2.43.0 or Alertmanager >= 0.25.0.',
                                type: 'object',
                                'x-kubernetes-map-type': 'atomic',
                              },
                              proxyFromEnvironment: {
                                description: 'Whether to use the proxy configuration defined by environment variables (HTTP_PROXY, HTTPS_PROXY, and NO_PROXY).\n\nIt requires Prometheus >= v2.43.0 or Alertmanager >= 0.25.0.',
                                type: 'boolean',
                              },
                              proxyURL: {
                                description: 'Optional proxy URL.\n\nIf defined, this field takes precedence over `proxyUrl`.',
                                type: 'string',
                              },
                              proxyUrl: {
                                description: '`proxyURL` defines the HTTP proxy server to use.',
                                pattern: '^http(s)?://.+$',
                                type: 'string',
                              },
                              tlsConfig: {
                                description: 'TLS configuration for the client.',
                                properties: {
                                  ca: {
                                    description: 'Certificate authority used when verifying server certificates.',
                                    properties: {
                                      configMap: {
                                        description: 'ConfigMap containing data to use for the targets.',
                                        properties: {
                                          key: {
                                            description: 'The key to select.',
                                            type: 'string',
                                          },
                                          name: {
                                            default: '',
                                            description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                            type: 'string',
                                          },
                                          optional: {
                                            description: 'Specify whether the ConfigMap or its key must be defined',
                                            type: 'boolean',
                                          },
                                        },
                                        required: [
                                          'key',
                                        ],
                                        type: 'object',
                                        'x-kubernetes-map-type': 'atomic',
                                      },
                                      secret: {
                                        description: 'Secret containing data to use for the targets.',
                                        properties: {
                                          key: {
                                            description: 'The key of the secret to select from.  Must be a valid secret key.',
                                            type: 'string',
                                          },
                                          name: {
                                            default: '',
                                            description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                            type: 'string',
                                          },
                                          optional: {
                                            description: 'Specify whether the Secret or its key must be defined',
                                            type: 'boolean',
                                          },
                                        },
                                        required: [
                                          'key',
                                        ],
                                        type: 'object',
                                        'x-kubernetes-map-type': 'atomic',
                                      },
                                    },
                                    type: 'object',
                                  },
                                  cert: {
                                    description: 'Client certificate to present when doing client-authentication.',
                                    properties: {
                                      configMap: {
                                        description: 'ConfigMap containing data to use for the targets.',
                                        properties: {
                                          key: {
                                            description: 'The key to select.',
                                            type: 'string',
                                          },
                                          name: {
                                            default: '',
                                            description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                            type: 'string',
                                          },
                                          optional: {
                                            description: 'Specify whether the ConfigMap or its key must be defined',
                                            type: 'boolean',
                                          },
                                        },
                                        required: [
                                          'key',
                                        ],
                                        type: 'object',
                                        'x-kubernetes-map-type': 'atomic',
                                      },
                                      secret: {
                                        description: 'Secret containing data to use for the targets.',
                                        properties: {
                                          key: {
                                            description: 'The key of the secret to select from.  Must be a valid secret key.',
                                            type: 'string',
                                          },
                                          name: {
                                            default: '',
                                            description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                            type: 'string',
                                          },
                                          optional: {
                                            description: 'Specify whether the Secret or its key must be defined',
                                            type: 'boolean',
                                          },
                                        },
                                        required: [
                                          'key',
                                        ],
                                        type: 'object',
                                        'x-kubernetes-map-type': 'atomic',
                                      },
                                    },
                                    type: 'object',
                                  },
                                  insecureSkipVerify: {
                                    description: 'Disable target certificate validation.',
                                    type: 'boolean',
                                  },
                                  keySecret: {
                                    description: 'Secret containing the client key file for the targets.',
                                    properties: {
                                      key: {
                                        description: 'The key of the secret to select from.  Must be a valid secret key.',
                                        type: 'string',
                                      },
                                      name: {
                                        default: '',
                                        description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                        type: 'string',
                                      },
                                      optional: {
                                        description: 'Specify whether the Secret or its key must be defined',
                                        type: 'boolean',
                                      },
                                    },
                                    required: [
                                      'key',
                                    ],
                                    type: 'object',
                                    'x-kubernetes-map-type': 'atomic',
                                  },
                                  maxVersion: {
                                    description: 'Maximum acceptable TLS version.\n\nIt requires Prometheus >= v2.41.0.',
                                    enum: [
                                      'TLS10',
                                      'TLS11',
                                      'TLS12',
                                      'TLS13',
                                    ],
                                    type: 'string',
                                  },
                                  minVersion: {
                                    description: 'Minimum acceptable TLS version.\n\nIt requires Prometheus >= v2.35.0.',
                                    enum: [
                                      'TLS10',
                                      'TLS11',
                                      'TLS12',
                                      'TLS13',
                                    ],
                                    type: 'string',
                                  },
                                  serverName: {
                                    description: 'Used to verify the hostname for the targets.',
                                    type: 'string',
                                  },
                                },
                                type: 'object',
                              },
                            },
                            type: 'object',
                          },
                          message: {
                            description: 'Notification message.',
                            type: 'string',
                          },
                          priority: {
                            description: 'Priority, see https://pushover.net/api#priority',
                            type: 'string',
                          },
                          retry: {
                            description: 'How often the Pushover servers will send the same notification to the user.\nMust be at least 30 seconds.',
                            pattern: '^(([0-9]+)y)?(([0-9]+)w)?(([0-9]+)d)?(([0-9]+)h)?(([0-9]+)m)?(([0-9]+)s)?(([0-9]+)ms)?$',
                            type: 'string',
                          },
                          sendResolved: {
                            description: 'Whether or not to notify about resolved alerts.',
                            type: 'boolean',
                          },
                          sound: {
                            description: "The name of one of the sounds supported by device clients to override the user's default sound choice",
                            type: 'string',
                          },
                          title: {
                            description: 'Notification title.',
                            type: 'string',
                          },
                          token: {
                            description: "The secret's key that contains the registered application's API token, see https://pushover.net/apps.\nThe secret needs to be in the same namespace as the AlertmanagerConfig\nobject and accessible by the Prometheus Operator.\nEither `token` or `tokenFile` is required.",
                            properties: {
                              key: {
                                description: 'The key of the secret to select from.  Must be a valid secret key.',
                                minLength: 1,
                                type: 'string',
                              },
                              name: {
                                description: "The name of the secret in the object's namespace to select from.",
                                minLength: 1,
                                type: 'string',
                              },
                            },
                            required: [
                              'key',
                              'name',
                            ],
                            type: 'object',
                          },
                          tokenFile: {
                            description: "The token file that contains the registered application's API token, see https://pushover.net/apps.\nEither `token` or `tokenFile` is required.\nIt requires Alertmanager >= v0.26.0.",
                            type: 'string',
                          },
                          ttl: {
                            description: 'The time to live definition for the alert notification',
                            pattern: '^(0|(([0-9]+)y)?(([0-9]+)w)?(([0-9]+)d)?(([0-9]+)h)?(([0-9]+)m)?(([0-9]+)s)?(([0-9]+)ms)?)$',
                            type: 'string',
                          },
                          url: {
                            description: 'A supplementary URL shown alongside the message.',
                            type: 'string',
                          },
                          urlTitle: {
                            description: 'A title for supplementary URL, otherwise just the URL is shown',
                            type: 'string',
                          },
                          userKey: {
                            description: "The secret's key that contains the recipient user's user key.\nThe secret needs to be in the same namespace as the AlertmanagerConfig\nobject and accessible by the Prometheus Operator.\nEither `userKey` or `userKeyFile` is required.",
                            properties: {
                              key: {
                                description: 'The key of the secret to select from.  Must be a valid secret key.',
                                minLength: 1,
                                type: 'string',
                              },
                              name: {
                                description: "The name of the secret in the object's namespace to select from.",
                                minLength: 1,
                                type: 'string',
                              },
                            },
                            required: [
                              'key',
                              'name',
                            ],
                            type: 'object',
                          },
                          userKeyFile: {
                            description: "The user key file that contains the recipient user's user key.\nEither `userKey` or `userKeyFile` is required.\nIt requires Alertmanager >= v0.26.0.",
                            type: 'string',
                          },
                        },
                        type: 'object',
                      },
                      type: 'array',
                    },
                    slackConfigs: {
                      description: 'List of Slack configurations.',
                      items: {
                        description: 'SlackConfig configures notifications via Slack.\nSee https://prometheus.io/docs/alerting/latest/configuration/#slack_config',
                        properties: {
                          actions: {
                            description: 'A list of Slack actions that are sent with each notification.',
                            items: {
                              description: 'SlackAction configures a single Slack action that is sent with each\nnotification.\nSee https://api.slack.com/docs/message-attachments#action_fields and\nhttps://api.slack.com/docs/message-buttons for more information.',
                              properties: {
                                confirm: {
                                  description: 'SlackConfirmationField protect users from destructive actions or\nparticularly distinguished decisions by asking them to confirm their button\nclick one more time.\nSee https://api.slack.com/docs/interactive-message-field-guide#confirmation_fields\nfor more information.',
                                  properties: {
                                    dismissText: {
                                      type: 'string',
                                    },
                                    okText: {
                                      type: 'string',
                                    },
                                    text: {
                                      minLength: 1,
                                      type: 'string',
                                    },
                                    title: {
                                      type: 'string',
                                    },
                                  },
                                  required: [
                                    'text',
                                  ],
                                  type: 'object',
                                },
                                name: {
                                  type: 'string',
                                },
                                style: {
                                  type: 'string',
                                },
                                text: {
                                  minLength: 1,
                                  type: 'string',
                                },
                                type: {
                                  minLength: 1,
                                  type: 'string',
                                },
                                url: {
                                  type: 'string',
                                },
                                value: {
                                  type: 'string',
                                },
                              },
                              required: [
                                'text',
                                'type',
                              ],
                              type: 'object',
                            },
                            type: 'array',
                          },
                          apiURL: {
                            description: "The secret's key that contains the Slack webhook URL.\nThe secret needs to be in the same namespace as the AlertmanagerConfig\nobject and accessible by the Prometheus Operator.",
                            properties: {
                              key: {
                                description: 'The key of the secret to select from.  Must be a valid secret key.',
                                minLength: 1,
                                type: 'string',
                              },
                              name: {
                                description: "The name of the secret in the object's namespace to select from.",
                                minLength: 1,
                                type: 'string',
                              },
                            },
                            required: [
                              'key',
                              'name',
                            ],
                            type: 'object',
                          },
                          callbackId: {
                            type: 'string',
                          },
                          channel: {
                            description: 'The channel or user to send notifications to.',
                            type: 'string',
                          },
                          color: {
                            type: 'string',
                          },
                          fallback: {
                            type: 'string',
                          },
                          fields: {
                            description: 'A list of Slack fields that are sent with each notification.',
                            items: {
                              description: 'SlackField configures a single Slack field that is sent with each notification.\nEach field must contain a title, value, and optionally, a boolean value to indicate if the field\nis short enough to be displayed next to other fields designated as short.\nSee https://api.slack.com/docs/message-attachments#fields for more information.',
                              properties: {
                                short: {
                                  type: 'boolean',
                                },
                                title: {
                                  minLength: 1,
                                  type: 'string',
                                },
                                value: {
                                  minLength: 1,
                                  type: 'string',
                                },
                              },
                              required: [
                                'title',
                                'value',
                              ],
                              type: 'object',
                            },
                            type: 'array',
                          },
                          footer: {
                            type: 'string',
                          },
                          httpConfig: {
                            description: 'HTTP client configuration.',
                            properties: {
                              authorization: {
                                description: 'Authorization header configuration for the client.\nThis is mutually exclusive with BasicAuth and is only available starting from Alertmanager v0.22+.',
                                properties: {
                                  credentials: {
                                    description: 'Selects a key of a Secret in the namespace that contains the credentials for authentication.',
                                    properties: {
                                      key: {
                                        description: 'The key of the secret to select from.  Must be a valid secret key.',
                                        type: 'string',
                                      },
                                      name: {
                                        default: '',
                                        description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                        type: 'string',
                                      },
                                      optional: {
                                        description: 'Specify whether the Secret or its key must be defined',
                                        type: 'boolean',
                                      },
                                    },
                                    required: [
                                      'key',
                                    ],
                                    type: 'object',
                                    'x-kubernetes-map-type': 'atomic',
                                  },
                                  type: {
                                    description: 'Defines the authentication type. The value is case-insensitive.\n\n"Basic" is not a supported value.\n\nDefault: "Bearer"',
                                    type: 'string',
                                  },
                                },
                                type: 'object',
                              },
                              basicAuth: {
                                description: 'BasicAuth for the client.\nThis is mutually exclusive with Authorization. If both are defined, BasicAuth takes precedence.',
                                properties: {
                                  password: {
                                    description: '`password` specifies a key of a Secret containing the password for\nauthentication.',
                                    properties: {
                                      key: {
                                        description: 'The key of the secret to select from.  Must be a valid secret key.',
                                        type: 'string',
                                      },
                                      name: {
                                        default: '',
                                        description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                        type: 'string',
                                      },
                                      optional: {
                                        description: 'Specify whether the Secret or its key must be defined',
                                        type: 'boolean',
                                      },
                                    },
                                    required: [
                                      'key',
                                    ],
                                    type: 'object',
                                    'x-kubernetes-map-type': 'atomic',
                                  },
                                  username: {
                                    description: '`username` specifies a key of a Secret containing the username for\nauthentication.',
                                    properties: {
                                      key: {
                                        description: 'The key of the secret to select from.  Must be a valid secret key.',
                                        type: 'string',
                                      },
                                      name: {
                                        default: '',
                                        description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                        type: 'string',
                                      },
                                      optional: {
                                        description: 'Specify whether the Secret or its key must be defined',
                                        type: 'boolean',
                                      },
                                    },
                                    required: [
                                      'key',
                                    ],
                                    type: 'object',
                                    'x-kubernetes-map-type': 'atomic',
                                  },
                                },
                                type: 'object',
                              },
                              bearerTokenSecret: {
                                description: "The secret's key that contains the bearer token to be used by the client\nfor authentication.\nThe secret needs to be in the same namespace as the AlertmanagerConfig\nobject and accessible by the Prometheus Operator.",
                                properties: {
                                  key: {
                                    description: 'The key of the secret to select from.  Must be a valid secret key.',
                                    minLength: 1,
                                    type: 'string',
                                  },
                                  name: {
                                    description: "The name of the secret in the object's namespace to select from.",
                                    minLength: 1,
                                    type: 'string',
                                  },
                                },
                                required: [
                                  'key',
                                  'name',
                                ],
                                type: 'object',
                              },
                              followRedirects: {
                                description: 'FollowRedirects specifies whether the client should follow HTTP 3xx redirects.',
                                type: 'boolean',
                              },
                              noProxy: {
                                description: '`noProxy` is a comma-separated string that can contain IPs, CIDR notation, domain names\nthat should be excluded from proxying. IP and domain names can\ncontain port numbers.\n\nIt requires Prometheus >= v2.43.0 or Alertmanager >= 0.25.0.',
                                type: 'string',
                              },
                              oauth2: {
                                description: 'OAuth2 client credentials used to fetch a token for the targets.',
                                properties: {
                                  clientId: {
                                    description: "`clientId` specifies a key of a Secret or ConfigMap containing the\nOAuth2 client's ID.",
                                    properties: {
                                      configMap: {
                                        description: 'ConfigMap containing data to use for the targets.',
                                        properties: {
                                          key: {
                                            description: 'The key to select.',
                                            type: 'string',
                                          },
                                          name: {
                                            default: '',
                                            description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                            type: 'string',
                                          },
                                          optional: {
                                            description: 'Specify whether the ConfigMap or its key must be defined',
                                            type: 'boolean',
                                          },
                                        },
                                        required: [
                                          'key',
                                        ],
                                        type: 'object',
                                        'x-kubernetes-map-type': 'atomic',
                                      },
                                      secret: {
                                        description: 'Secret containing data to use for the targets.',
                                        properties: {
                                          key: {
                                            description: 'The key of the secret to select from.  Must be a valid secret key.',
                                            type: 'string',
                                          },
                                          name: {
                                            default: '',
                                            description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                            type: 'string',
                                          },
                                          optional: {
                                            description: 'Specify whether the Secret or its key must be defined',
                                            type: 'boolean',
                                          },
                                        },
                                        required: [
                                          'key',
                                        ],
                                        type: 'object',
                                        'x-kubernetes-map-type': 'atomic',
                                      },
                                    },
                                    type: 'object',
                                  },
                                  clientSecret: {
                                    description: "`clientSecret` specifies a key of a Secret containing the OAuth2\nclient's secret.",
                                    properties: {
                                      key: {
                                        description: 'The key of the secret to select from.  Must be a valid secret key.',
                                        type: 'string',
                                      },
                                      name: {
                                        default: '',
                                        description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                        type: 'string',
                                      },
                                      optional: {
                                        description: 'Specify whether the Secret or its key must be defined',
                                        type: 'boolean',
                                      },
                                    },
                                    required: [
                                      'key',
                                    ],
                                    type: 'object',
                                    'x-kubernetes-map-type': 'atomic',
                                  },
                                  endpointParams: {
                                    additionalProperties: {
                                      type: 'string',
                                    },
                                    description: '`endpointParams` configures the HTTP parameters to append to the token\nURL.',
                                    type: 'object',
                                  },
                                  noProxy: {
                                    description: '`noProxy` is a comma-separated string that can contain IPs, CIDR notation, domain names\nthat should be excluded from proxying. IP and domain names can\ncontain port numbers.\n\nIt requires Prometheus >= v2.43.0 or Alertmanager >= 0.25.0.',
                                    type: 'string',
                                  },
                                  proxyConnectHeader: {
                                    additionalProperties: {
                                      items: {
                                        description: 'SecretKeySelector selects a key of a Secret.',
                                        properties: {
                                          key: {
                                            description: 'The key of the secret to select from.  Must be a valid secret key.',
                                            type: 'string',
                                          },
                                          name: {
                                            default: '',
                                            description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                            type: 'string',
                                          },
                                          optional: {
                                            description: 'Specify whether the Secret or its key must be defined',
                                            type: 'boolean',
                                          },
                                        },
                                        required: [
                                          'key',
                                        ],
                                        type: 'object',
                                        'x-kubernetes-map-type': 'atomic',
                                      },
                                      type: 'array',
                                    },
                                    description: 'ProxyConnectHeader optionally specifies headers to send to\nproxies during CONNECT requests.\n\nIt requires Prometheus >= v2.43.0 or Alertmanager >= 0.25.0.',
                                    type: 'object',
                                    'x-kubernetes-map-type': 'atomic',
                                  },
                                  proxyFromEnvironment: {
                                    description: 'Whether to use the proxy configuration defined by environment variables (HTTP_PROXY, HTTPS_PROXY, and NO_PROXY).\n\nIt requires Prometheus >= v2.43.0 or Alertmanager >= 0.25.0.',
                                    type: 'boolean',
                                  },
                                  proxyUrl: {
                                    description: '`proxyURL` defines the HTTP proxy server to use.',
                                    pattern: '^http(s)?://.+$',
                                    type: 'string',
                                  },
                                  scopes: {
                                    description: '`scopes` defines the OAuth2 scopes used for the token request.',
                                    items: {
                                      type: 'string',
                                    },
                                    type: 'array',
                                  },
                                  tlsConfig: {
                                    description: 'TLS configuration to use when connecting to the OAuth2 server.\nIt requires Prometheus >= v2.43.0.',
                                    properties: {
                                      ca: {
                                        description: 'Certificate authority used when verifying server certificates.',
                                        properties: {
                                          configMap: {
                                            description: 'ConfigMap containing data to use for the targets.',
                                            properties: {
                                              key: {
                                                description: 'The key to select.',
                                                type: 'string',
                                              },
                                              name: {
                                                default: '',
                                                description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                                type: 'string',
                                              },
                                              optional: {
                                                description: 'Specify whether the ConfigMap or its key must be defined',
                                                type: 'boolean',
                                              },
                                            },
                                            required: [
                                              'key',
                                            ],
                                            type: 'object',
                                            'x-kubernetes-map-type': 'atomic',
                                          },
                                          secret: {
                                            description: 'Secret containing data to use for the targets.',
                                            properties: {
                                              key: {
                                                description: 'The key of the secret to select from.  Must be a valid secret key.',
                                                type: 'string',
                                              },
                                              name: {
                                                default: '',
                                                description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                                type: 'string',
                                              },
                                              optional: {
                                                description: 'Specify whether the Secret or its key must be defined',
                                                type: 'boolean',
                                              },
                                            },
                                            required: [
                                              'key',
                                            ],
                                            type: 'object',
                                            'x-kubernetes-map-type': 'atomic',
                                          },
                                        },
                                        type: 'object',
                                      },
                                      cert: {
                                        description: 'Client certificate to present when doing client-authentication.',
                                        properties: {
                                          configMap: {
                                            description: 'ConfigMap containing data to use for the targets.',
                                            properties: {
                                              key: {
                                                description: 'The key to select.',
                                                type: 'string',
                                              },
                                              name: {
                                                default: '',
                                                description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                                type: 'string',
                                              },
                                              optional: {
                                                description: 'Specify whether the ConfigMap or its key must be defined',
                                                type: 'boolean',
                                              },
                                            },
                                            required: [
                                              'key',
                                            ],
                                            type: 'object',
                                            'x-kubernetes-map-type': 'atomic',
                                          },
                                          secret: {
                                            description: 'Secret containing data to use for the targets.',
                                            properties: {
                                              key: {
                                                description: 'The key of the secret to select from.  Must be a valid secret key.',
                                                type: 'string',
                                              },
                                              name: {
                                                default: '',
                                                description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                                type: 'string',
                                              },
                                              optional: {
                                                description: 'Specify whether the Secret or its key must be defined',
                                                type: 'boolean',
                                              },
                                            },
                                            required: [
                                              'key',
                                            ],
                                            type: 'object',
                                            'x-kubernetes-map-type': 'atomic',
                                          },
                                        },
                                        type: 'object',
                                      },
                                      insecureSkipVerify: {
                                        description: 'Disable target certificate validation.',
                                        type: 'boolean',
                                      },
                                      keySecret: {
                                        description: 'Secret containing the client key file for the targets.',
                                        properties: {
                                          key: {
                                            description: 'The key of the secret to select from.  Must be a valid secret key.',
                                            type: 'string',
                                          },
                                          name: {
                                            default: '',
                                            description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                            type: 'string',
                                          },
                                          optional: {
                                            description: 'Specify whether the Secret or its key must be defined',
                                            type: 'boolean',
                                          },
                                        },
                                        required: [
                                          'key',
                                        ],
                                        type: 'object',
                                        'x-kubernetes-map-type': 'atomic',
                                      },
                                      maxVersion: {
                                        description: 'Maximum acceptable TLS version.\n\nIt requires Prometheus >= v2.41.0.',
                                        enum: [
                                          'TLS10',
                                          'TLS11',
                                          'TLS12',
                                          'TLS13',
                                        ],
                                        type: 'string',
                                      },
                                      minVersion: {
                                        description: 'Minimum acceptable TLS version.\n\nIt requires Prometheus >= v2.35.0.',
                                        enum: [
                                          'TLS10',
                                          'TLS11',
                                          'TLS12',
                                          'TLS13',
                                        ],
                                        type: 'string',
                                      },
                                      serverName: {
                                        description: 'Used to verify the hostname for the targets.',
                                        type: 'string',
                                      },
                                    },
                                    type: 'object',
                                  },
                                  tokenUrl: {
                                    description: '`tokenURL` configures the URL to fetch the token from.',
                                    minLength: 1,
                                    type: 'string',
                                  },
                                },
                                required: [
                                  'clientId',
                                  'clientSecret',
                                  'tokenUrl',
                                ],
                                type: 'object',
                              },
                              proxyConnectHeader: {
                                additionalProperties: {
                                  items: {
                                    description: 'SecretKeySelector selects a key of a Secret.',
                                    properties: {
                                      key: {
                                        description: 'The key of the secret to select from.  Must be a valid secret key.',
                                        type: 'string',
                                      },
                                      name: {
                                        default: '',
                                        description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                        type: 'string',
                                      },
                                      optional: {
                                        description: 'Specify whether the Secret or its key must be defined',
                                        type: 'boolean',
                                      },
                                    },
                                    required: [
                                      'key',
                                    ],
                                    type: 'object',
                                    'x-kubernetes-map-type': 'atomic',
                                  },
                                  type: 'array',
                                },
                                description: 'ProxyConnectHeader optionally specifies headers to send to\nproxies during CONNECT requests.\n\nIt requires Prometheus >= v2.43.0 or Alertmanager >= 0.25.0.',
                                type: 'object',
                                'x-kubernetes-map-type': 'atomic',
                              },
                              proxyFromEnvironment: {
                                description: 'Whether to use the proxy configuration defined by environment variables (HTTP_PROXY, HTTPS_PROXY, and NO_PROXY).\n\nIt requires Prometheus >= v2.43.0 or Alertmanager >= 0.25.0.',
                                type: 'boolean',
                              },
                              proxyURL: {
                                description: 'Optional proxy URL.\n\nIf defined, this field takes precedence over `proxyUrl`.',
                                type: 'string',
                              },
                              proxyUrl: {
                                description: '`proxyURL` defines the HTTP proxy server to use.',
                                pattern: '^http(s)?://.+$',
                                type: 'string',
                              },
                              tlsConfig: {
                                description: 'TLS configuration for the client.',
                                properties: {
                                  ca: {
                                    description: 'Certificate authority used when verifying server certificates.',
                                    properties: {
                                      configMap: {
                                        description: 'ConfigMap containing data to use for the targets.',
                                        properties: {
                                          key: {
                                            description: 'The key to select.',
                                            type: 'string',
                                          },
                                          name: {
                                            default: '',
                                            description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                            type: 'string',
                                          },
                                          optional: {
                                            description: 'Specify whether the ConfigMap or its key must be defined',
                                            type: 'boolean',
                                          },
                                        },
                                        required: [
                                          'key',
                                        ],
                                        type: 'object',
                                        'x-kubernetes-map-type': 'atomic',
                                      },
                                      secret: {
                                        description: 'Secret containing data to use for the targets.',
                                        properties: {
                                          key: {
                                            description: 'The key of the secret to select from.  Must be a valid secret key.',
                                            type: 'string',
                                          },
                                          name: {
                                            default: '',
                                            description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                            type: 'string',
                                          },
                                          optional: {
                                            description: 'Specify whether the Secret or its key must be defined',
                                            type: 'boolean',
                                          },
                                        },
                                        required: [
                                          'key',
                                        ],
                                        type: 'object',
                                        'x-kubernetes-map-type': 'atomic',
                                      },
                                    },
                                    type: 'object',
                                  },
                                  cert: {
                                    description: 'Client certificate to present when doing client-authentication.',
                                    properties: {
                                      configMap: {
                                        description: 'ConfigMap containing data to use for the targets.',
                                        properties: {
                                          key: {
                                            description: 'The key to select.',
                                            type: 'string',
                                          },
                                          name: {
                                            default: '',
                                            description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                            type: 'string',
                                          },
                                          optional: {
                                            description: 'Specify whether the ConfigMap or its key must be defined',
                                            type: 'boolean',
                                          },
                                        },
                                        required: [
                                          'key',
                                        ],
                                        type: 'object',
                                        'x-kubernetes-map-type': 'atomic',
                                      },
                                      secret: {
                                        description: 'Secret containing data to use for the targets.',
                                        properties: {
                                          key: {
                                            description: 'The key of the secret to select from.  Must be a valid secret key.',
                                            type: 'string',
                                          },
                                          name: {
                                            default: '',
                                            description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                            type: 'string',
                                          },
                                          optional: {
                                            description: 'Specify whether the Secret or its key must be defined',
                                            type: 'boolean',
                                          },
                                        },
                                        required: [
                                          'key',
                                        ],
                                        type: 'object',
                                        'x-kubernetes-map-type': 'atomic',
                                      },
                                    },
                                    type: 'object',
                                  },
                                  insecureSkipVerify: {
                                    description: 'Disable target certificate validation.',
                                    type: 'boolean',
                                  },
                                  keySecret: {
                                    description: 'Secret containing the client key file for the targets.',
                                    properties: {
                                      key: {
                                        description: 'The key of the secret to select from.  Must be a valid secret key.',
                                        type: 'string',
                                      },
                                      name: {
                                        default: '',
                                        description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                        type: 'string',
                                      },
                                      optional: {
                                        description: 'Specify whether the Secret or its key must be defined',
                                        type: 'boolean',
                                      },
                                    },
                                    required: [
                                      'key',
                                    ],
                                    type: 'object',
                                    'x-kubernetes-map-type': 'atomic',
                                  },
                                  maxVersion: {
                                    description: 'Maximum acceptable TLS version.\n\nIt requires Prometheus >= v2.41.0.',
                                    enum: [
                                      'TLS10',
                                      'TLS11',
                                      'TLS12',
                                      'TLS13',
                                    ],
                                    type: 'string',
                                  },
                                  minVersion: {
                                    description: 'Minimum acceptable TLS version.\n\nIt requires Prometheus >= v2.35.0.',
                                    enum: [
                                      'TLS10',
                                      'TLS11',
                                      'TLS12',
                                      'TLS13',
                                    ],
                                    type: 'string',
                                  },
                                  serverName: {
                                    description: 'Used to verify the hostname for the targets.',
                                    type: 'string',
                                  },
                                },
                                type: 'object',
                              },
                            },
                            type: 'object',
                          },
                          iconEmoji: {
                            type: 'string',
                          },
                          iconURL: {
                            type: 'string',
                          },
                          imageURL: {
                            type: 'string',
                          },
                          linkNames: {
                            type: 'boolean',
                          },
                          mrkdwnIn: {
                            items: {
                              type: 'string',
                            },
                            type: 'array',
                          },
                          pretext: {
                            type: 'string',
                          },
                          sendResolved: {
                            description: 'Whether or not to notify about resolved alerts.',
                            type: 'boolean',
                          },
                          shortFields: {
                            type: 'boolean',
                          },
                          text: {
                            type: 'string',
                          },
                          thumbURL: {
                            type: 'string',
                          },
                          title: {
                            type: 'string',
                          },
                          titleLink: {
                            type: 'string',
                          },
                          username: {
                            type: 'string',
                          },
                        },
                        type: 'object',
                      },
                      type: 'array',
                    },
                    snsConfigs: {
                      description: 'List of SNS configurations',
                      items: {
                        description: 'SNSConfig configures notifications via AWS SNS.\nSee https://prometheus.io/docs/alerting/latest/configuration/#sns_configs',
                        properties: {
                          apiURL: {
                            description: 'The SNS API URL i.e. https://sns.us-east-2.amazonaws.com.\nIf not specified, the SNS API URL from the SNS SDK will be used.',
                            type: 'string',
                          },
                          attributes: {
                            additionalProperties: {
                              type: 'string',
                            },
                            description: 'SNS message attributes.',
                            type: 'object',
                          },
                          httpConfig: {
                            description: 'HTTP client configuration.',
                            properties: {
                              authorization: {
                                description: 'Authorization header configuration for the client.\nThis is mutually exclusive with BasicAuth and is only available starting from Alertmanager v0.22+.',
                                properties: {
                                  credentials: {
                                    description: 'Selects a key of a Secret in the namespace that contains the credentials for authentication.',
                                    properties: {
                                      key: {
                                        description: 'The key of the secret to select from.  Must be a valid secret key.',
                                        type: 'string',
                                      },
                                      name: {
                                        default: '',
                                        description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                        type: 'string',
                                      },
                                      optional: {
                                        description: 'Specify whether the Secret or its key must be defined',
                                        type: 'boolean',
                                      },
                                    },
                                    required: [
                                      'key',
                                    ],
                                    type: 'object',
                                    'x-kubernetes-map-type': 'atomic',
                                  },
                                  type: {
                                    description: 'Defines the authentication type. The value is case-insensitive.\n\n"Basic" is not a supported value.\n\nDefault: "Bearer"',
                                    type: 'string',
                                  },
                                },
                                type: 'object',
                              },
                              basicAuth: {
                                description: 'BasicAuth for the client.\nThis is mutually exclusive with Authorization. If both are defined, BasicAuth takes precedence.',
                                properties: {
                                  password: {
                                    description: '`password` specifies a key of a Secret containing the password for\nauthentication.',
                                    properties: {
                                      key: {
                                        description: 'The key of the secret to select from.  Must be a valid secret key.',
                                        type: 'string',
                                      },
                                      name: {
                                        default: '',
                                        description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                        type: 'string',
                                      },
                                      optional: {
                                        description: 'Specify whether the Secret or its key must be defined',
                                        type: 'boolean',
                                      },
                                    },
                                    required: [
                                      'key',
                                    ],
                                    type: 'object',
                                    'x-kubernetes-map-type': 'atomic',
                                  },
                                  username: {
                                    description: '`username` specifies a key of a Secret containing the username for\nauthentication.',
                                    properties: {
                                      key: {
                                        description: 'The key of the secret to select from.  Must be a valid secret key.',
                                        type: 'string',
                                      },
                                      name: {
                                        default: '',
                                        description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                        type: 'string',
                                      },
                                      optional: {
                                        description: 'Specify whether the Secret or its key must be defined',
                                        type: 'boolean',
                                      },
                                    },
                                    required: [
                                      'key',
                                    ],
                                    type: 'object',
                                    'x-kubernetes-map-type': 'atomic',
                                  },
                                },
                                type: 'object',
                              },
                              bearerTokenSecret: {
                                description: "The secret's key that contains the bearer token to be used by the client\nfor authentication.\nThe secret needs to be in the same namespace as the AlertmanagerConfig\nobject and accessible by the Prometheus Operator.",
                                properties: {
                                  key: {
                                    description: 'The key of the secret to select from.  Must be a valid secret key.',
                                    minLength: 1,
                                    type: 'string',
                                  },
                                  name: {
                                    description: "The name of the secret in the object's namespace to select from.",
                                    minLength: 1,
                                    type: 'string',
                                  },
                                },
                                required: [
                                  'key',
                                  'name',
                                ],
                                type: 'object',
                              },
                              followRedirects: {
                                description: 'FollowRedirects specifies whether the client should follow HTTP 3xx redirects.',
                                type: 'boolean',
                              },
                              noProxy: {
                                description: '`noProxy` is a comma-separated string that can contain IPs, CIDR notation, domain names\nthat should be excluded from proxying. IP and domain names can\ncontain port numbers.\n\nIt requires Prometheus >= v2.43.0 or Alertmanager >= 0.25.0.',
                                type: 'string',
                              },
                              oauth2: {
                                description: 'OAuth2 client credentials used to fetch a token for the targets.',
                                properties: {
                                  clientId: {
                                    description: "`clientId` specifies a key of a Secret or ConfigMap containing the\nOAuth2 client's ID.",
                                    properties: {
                                      configMap: {
                                        description: 'ConfigMap containing data to use for the targets.',
                                        properties: {
                                          key: {
                                            description: 'The key to select.',
                                            type: 'string',
                                          },
                                          name: {
                                            default: '',
                                            description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                            type: 'string',
                                          },
                                          optional: {
                                            description: 'Specify whether the ConfigMap or its key must be defined',
                                            type: 'boolean',
                                          },
                                        },
                                        required: [
                                          'key',
                                        ],
                                        type: 'object',
                                        'x-kubernetes-map-type': 'atomic',
                                      },
                                      secret: {
                                        description: 'Secret containing data to use for the targets.',
                                        properties: {
                                          key: {
                                            description: 'The key of the secret to select from.  Must be a valid secret key.',
                                            type: 'string',
                                          },
                                          name: {
                                            default: '',
                                            description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                            type: 'string',
                                          },
                                          optional: {
                                            description: 'Specify whether the Secret or its key must be defined',
                                            type: 'boolean',
                                          },
                                        },
                                        required: [
                                          'key',
                                        ],
                                        type: 'object',
                                        'x-kubernetes-map-type': 'atomic',
                                      },
                                    },
                                    type: 'object',
                                  },
                                  clientSecret: {
                                    description: "`clientSecret` specifies a key of a Secret containing the OAuth2\nclient's secret.",
                                    properties: {
                                      key: {
                                        description: 'The key of the secret to select from.  Must be a valid secret key.',
                                        type: 'string',
                                      },
                                      name: {
                                        default: '',
                                        description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                        type: 'string',
                                      },
                                      optional: {
                                        description: 'Specify whether the Secret or its key must be defined',
                                        type: 'boolean',
                                      },
                                    },
                                    required: [
                                      'key',
                                    ],
                                    type: 'object',
                                    'x-kubernetes-map-type': 'atomic',
                                  },
                                  endpointParams: {
                                    additionalProperties: {
                                      type: 'string',
                                    },
                                    description: '`endpointParams` configures the HTTP parameters to append to the token\nURL.',
                                    type: 'object',
                                  },
                                  noProxy: {
                                    description: '`noProxy` is a comma-separated string that can contain IPs, CIDR notation, domain names\nthat should be excluded from proxying. IP and domain names can\ncontain port numbers.\n\nIt requires Prometheus >= v2.43.0 or Alertmanager >= 0.25.0.',
                                    type: 'string',
                                  },
                                  proxyConnectHeader: {
                                    additionalProperties: {
                                      items: {
                                        description: 'SecretKeySelector selects a key of a Secret.',
                                        properties: {
                                          key: {
                                            description: 'The key of the secret to select from.  Must be a valid secret key.',
                                            type: 'string',
                                          },
                                          name: {
                                            default: '',
                                            description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                            type: 'string',
                                          },
                                          optional: {
                                            description: 'Specify whether the Secret or its key must be defined',
                                            type: 'boolean',
                                          },
                                        },
                                        required: [
                                          'key',
                                        ],
                                        type: 'object',
                                        'x-kubernetes-map-type': 'atomic',
                                      },
                                      type: 'array',
                                    },
                                    description: 'ProxyConnectHeader optionally specifies headers to send to\nproxies during CONNECT requests.\n\nIt requires Prometheus >= v2.43.0 or Alertmanager >= 0.25.0.',
                                    type: 'object',
                                    'x-kubernetes-map-type': 'atomic',
                                  },
                                  proxyFromEnvironment: {
                                    description: 'Whether to use the proxy configuration defined by environment variables (HTTP_PROXY, HTTPS_PROXY, and NO_PROXY).\n\nIt requires Prometheus >= v2.43.0 or Alertmanager >= 0.25.0.',
                                    type: 'boolean',
                                  },
                                  proxyUrl: {
                                    description: '`proxyURL` defines the HTTP proxy server to use.',
                                    pattern: '^http(s)?://.+$',
                                    type: 'string',
                                  },
                                  scopes: {
                                    description: '`scopes` defines the OAuth2 scopes used for the token request.',
                                    items: {
                                      type: 'string',
                                    },
                                    type: 'array',
                                  },
                                  tlsConfig: {
                                    description: 'TLS configuration to use when connecting to the OAuth2 server.\nIt requires Prometheus >= v2.43.0.',
                                    properties: {
                                      ca: {
                                        description: 'Certificate authority used when verifying server certificates.',
                                        properties: {
                                          configMap: {
                                            description: 'ConfigMap containing data to use for the targets.',
                                            properties: {
                                              key: {
                                                description: 'The key to select.',
                                                type: 'string',
                                              },
                                              name: {
                                                default: '',
                                                description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                                type: 'string',
                                              },
                                              optional: {
                                                description: 'Specify whether the ConfigMap or its key must be defined',
                                                type: 'boolean',
                                              },
                                            },
                                            required: [
                                              'key',
                                            ],
                                            type: 'object',
                                            'x-kubernetes-map-type': 'atomic',
                                          },
                                          secret: {
                                            description: 'Secret containing data to use for the targets.',
                                            properties: {
                                              key: {
                                                description: 'The key of the secret to select from.  Must be a valid secret key.',
                                                type: 'string',
                                              },
                                              name: {
                                                default: '',
                                                description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                                type: 'string',
                                              },
                                              optional: {
                                                description: 'Specify whether the Secret or its key must be defined',
                                                type: 'boolean',
                                              },
                                            },
                                            required: [
                                              'key',
                                            ],
                                            type: 'object',
                                            'x-kubernetes-map-type': 'atomic',
                                          },
                                        },
                                        type: 'object',
                                      },
                                      cert: {
                                        description: 'Client certificate to present when doing client-authentication.',
                                        properties: {
                                          configMap: {
                                            description: 'ConfigMap containing data to use for the targets.',
                                            properties: {
                                              key: {
                                                description: 'The key to select.',
                                                type: 'string',
                                              },
                                              name: {
                                                default: '',
                                                description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                                type: 'string',
                                              },
                                              optional: {
                                                description: 'Specify whether the ConfigMap or its key must be defined',
                                                type: 'boolean',
                                              },
                                            },
                                            required: [
                                              'key',
                                            ],
                                            type: 'object',
                                            'x-kubernetes-map-type': 'atomic',
                                          },
                                          secret: {
                                            description: 'Secret containing data to use for the targets.',
                                            properties: {
                                              key: {
                                                description: 'The key of the secret to select from.  Must be a valid secret key.',
                                                type: 'string',
                                              },
                                              name: {
                                                default: '',
                                                description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                                type: 'string',
                                              },
                                              optional: {
                                                description: 'Specify whether the Secret or its key must be defined',
                                                type: 'boolean',
                                              },
                                            },
                                            required: [
                                              'key',
                                            ],
                                            type: 'object',
                                            'x-kubernetes-map-type': 'atomic',
                                          },
                                        },
                                        type: 'object',
                                      },
                                      insecureSkipVerify: {
                                        description: 'Disable target certificate validation.',
                                        type: 'boolean',
                                      },
                                      keySecret: {
                                        description: 'Secret containing the client key file for the targets.',
                                        properties: {
                                          key: {
                                            description: 'The key of the secret to select from.  Must be a valid secret key.',
                                            type: 'string',
                                          },
                                          name: {
                                            default: '',
                                            description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                            type: 'string',
                                          },
                                          optional: {
                                            description: 'Specify whether the Secret or its key must be defined',
                                            type: 'boolean',
                                          },
                                        },
                                        required: [
                                          'key',
                                        ],
                                        type: 'object',
                                        'x-kubernetes-map-type': 'atomic',
                                      },
                                      maxVersion: {
                                        description: 'Maximum acceptable TLS version.\n\nIt requires Prometheus >= v2.41.0.',
                                        enum: [
                                          'TLS10',
                                          'TLS11',
                                          'TLS12',
                                          'TLS13',
                                        ],
                                        type: 'string',
                                      },
                                      minVersion: {
                                        description: 'Minimum acceptable TLS version.\n\nIt requires Prometheus >= v2.35.0.',
                                        enum: [
                                          'TLS10',
                                          'TLS11',
                                          'TLS12',
                                          'TLS13',
                                        ],
                                        type: 'string',
                                      },
                                      serverName: {
                                        description: 'Used to verify the hostname for the targets.',
                                        type: 'string',
                                      },
                                    },
                                    type: 'object',
                                  },
                                  tokenUrl: {
                                    description: '`tokenURL` configures the URL to fetch the token from.',
                                    minLength: 1,
                                    type: 'string',
                                  },
                                },
                                required: [
                                  'clientId',
                                  'clientSecret',
                                  'tokenUrl',
                                ],
                                type: 'object',
                              },
                              proxyConnectHeader: {
                                additionalProperties: {
                                  items: {
                                    description: 'SecretKeySelector selects a key of a Secret.',
                                    properties: {
                                      key: {
                                        description: 'The key of the secret to select from.  Must be a valid secret key.',
                                        type: 'string',
                                      },
                                      name: {
                                        default: '',
                                        description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                        type: 'string',
                                      },
                                      optional: {
                                        description: 'Specify whether the Secret or its key must be defined',
                                        type: 'boolean',
                                      },
                                    },
                                    required: [
                                      'key',
                                    ],
                                    type: 'object',
                                    'x-kubernetes-map-type': 'atomic',
                                  },
                                  type: 'array',
                                },
                                description: 'ProxyConnectHeader optionally specifies headers to send to\nproxies during CONNECT requests.\n\nIt requires Prometheus >= v2.43.0 or Alertmanager >= 0.25.0.',
                                type: 'object',
                                'x-kubernetes-map-type': 'atomic',
                              },
                              proxyFromEnvironment: {
                                description: 'Whether to use the proxy configuration defined by environment variables (HTTP_PROXY, HTTPS_PROXY, and NO_PROXY).\n\nIt requires Prometheus >= v2.43.0 or Alertmanager >= 0.25.0.',
                                type: 'boolean',
                              },
                              proxyURL: {
                                description: 'Optional proxy URL.\n\nIf defined, this field takes precedence over `proxyUrl`.',
                                type: 'string',
                              },
                              proxyUrl: {
                                description: '`proxyURL` defines the HTTP proxy server to use.',
                                pattern: '^http(s)?://.+$',
                                type: 'string',
                              },
                              tlsConfig: {
                                description: 'TLS configuration for the client.',
                                properties: {
                                  ca: {
                                    description: 'Certificate authority used when verifying server certificates.',
                                    properties: {
                                      configMap: {
                                        description: 'ConfigMap containing data to use for the targets.',
                                        properties: {
                                          key: {
                                            description: 'The key to select.',
                                            type: 'string',
                                          },
                                          name: {
                                            default: '',
                                            description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                            type: 'string',
                                          },
                                          optional: {
                                            description: 'Specify whether the ConfigMap or its key must be defined',
                                            type: 'boolean',
                                          },
                                        },
                                        required: [
                                          'key',
                                        ],
                                        type: 'object',
                                        'x-kubernetes-map-type': 'atomic',
                                      },
                                      secret: {
                                        description: 'Secret containing data to use for the targets.',
                                        properties: {
                                          key: {
                                            description: 'The key of the secret to select from.  Must be a valid secret key.',
                                            type: 'string',
                                          },
                                          name: {
                                            default: '',
                                            description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                            type: 'string',
                                          },
                                          optional: {
                                            description: 'Specify whether the Secret or its key must be defined',
                                            type: 'boolean',
                                          },
                                        },
                                        required: [
                                          'key',
                                        ],
                                        type: 'object',
                                        'x-kubernetes-map-type': 'atomic',
                                      },
                                    },
                                    type: 'object',
                                  },
                                  cert: {
                                    description: 'Client certificate to present when doing client-authentication.',
                                    properties: {
                                      configMap: {
                                        description: 'ConfigMap containing data to use for the targets.',
                                        properties: {
                                          key: {
                                            description: 'The key to select.',
                                            type: 'string',
                                          },
                                          name: {
                                            default: '',
                                            description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                            type: 'string',
                                          },
                                          optional: {
                                            description: 'Specify whether the ConfigMap or its key must be defined',
                                            type: 'boolean',
                                          },
                                        },
                                        required: [
                                          'key',
                                        ],
                                        type: 'object',
                                        'x-kubernetes-map-type': 'atomic',
                                      },
                                      secret: {
                                        description: 'Secret containing data to use for the targets.',
                                        properties: {
                                          key: {
                                            description: 'The key of the secret to select from.  Must be a valid secret key.',
                                            type: 'string',
                                          },
                                          name: {
                                            default: '',
                                            description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                            type: 'string',
                                          },
                                          optional: {
                                            description: 'Specify whether the Secret or its key must be defined',
                                            type: 'boolean',
                                          },
                                        },
                                        required: [
                                          'key',
                                        ],
                                        type: 'object',
                                        'x-kubernetes-map-type': 'atomic',
                                      },
                                    },
                                    type: 'object',
                                  },
                                  insecureSkipVerify: {
                                    description: 'Disable target certificate validation.',
                                    type: 'boolean',
                                  },
                                  keySecret: {
                                    description: 'Secret containing the client key file for the targets.',
                                    properties: {
                                      key: {
                                        description: 'The key of the secret to select from.  Must be a valid secret key.',
                                        type: 'string',
                                      },
                                      name: {
                                        default: '',
                                        description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                        type: 'string',
                                      },
                                      optional: {
                                        description: 'Specify whether the Secret or its key must be defined',
                                        type: 'boolean',
                                      },
                                    },
                                    required: [
                                      'key',
                                    ],
                                    type: 'object',
                                    'x-kubernetes-map-type': 'atomic',
                                  },
                                  maxVersion: {
                                    description: 'Maximum acceptable TLS version.\n\nIt requires Prometheus >= v2.41.0.',
                                    enum: [
                                      'TLS10',
                                      'TLS11',
                                      'TLS12',
                                      'TLS13',
                                    ],
                                    type: 'string',
                                  },
                                  minVersion: {
                                    description: 'Minimum acceptable TLS version.\n\nIt requires Prometheus >= v2.35.0.',
                                    enum: [
                                      'TLS10',
                                      'TLS11',
                                      'TLS12',
                                      'TLS13',
                                    ],
                                    type: 'string',
                                  },
                                  serverName: {
                                    description: 'Used to verify the hostname for the targets.',
                                    type: 'string',
                                  },
                                },
                                type: 'object',
                              },
                            },
                            type: 'object',
                          },
                          message: {
                            description: 'The message content of the SNS notification.',
                            type: 'string',
                          },
                          phoneNumber: {
                            description: "Phone number if message is delivered via SMS in E.164 format.\nIf you don't specify this value, you must specify a value for the TopicARN or TargetARN.",
                            type: 'string',
                          },
                          sendResolved: {
                            description: 'Whether or not to notify about resolved alerts.',
                            type: 'boolean',
                          },
                          sigv4: {
                            description: "Configures AWS's Signature Verification 4 signing process to sign requests.",
                            properties: {
                              accessKey: {
                                description: 'AccessKey is the AWS API key. If not specified, the environment variable\n`AWS_ACCESS_KEY_ID` is used.',
                                properties: {
                                  key: {
                                    description: 'The key of the secret to select from.  Must be a valid secret key.',
                                    type: 'string',
                                  },
                                  name: {
                                    default: '',
                                    description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                    type: 'string',
                                  },
                                  optional: {
                                    description: 'Specify whether the Secret or its key must be defined',
                                    type: 'boolean',
                                  },
                                },
                                required: [
                                  'key',
                                ],
                                type: 'object',
                                'x-kubernetes-map-type': 'atomic',
                              },
                              profile: {
                                description: 'Profile is the named AWS profile used to authenticate.',
                                type: 'string',
                              },
                              region: {
                                description: 'Region is the AWS region. If blank, the region from the default credentials chain used.',
                                type: 'string',
                              },
                              roleArn: {
                                description: 'RoleArn is the named AWS profile used to authenticate.',
                                type: 'string',
                              },
                              secretKey: {
                                description: 'SecretKey is the AWS API secret. If not specified, the environment\nvariable `AWS_SECRET_ACCESS_KEY` is used.',
                                properties: {
                                  key: {
                                    description: 'The key of the secret to select from.  Must be a valid secret key.',
                                    type: 'string',
                                  },
                                  name: {
                                    default: '',
                                    description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                    type: 'string',
                                  },
                                  optional: {
                                    description: 'Specify whether the Secret or its key must be defined',
                                    type: 'boolean',
                                  },
                                },
                                required: [
                                  'key',
                                ],
                                type: 'object',
                                'x-kubernetes-map-type': 'atomic',
                              },
                            },
                            type: 'object',
                          },
                          subject: {
                            description: 'Subject line when the message is delivered to email endpoints.',
                            type: 'string',
                          },
                          targetARN: {
                            description: "The  mobile platform endpoint ARN if message is delivered via mobile notifications.\nIf you don't specify this value, you must specify a value for the topic_arn or PhoneNumber.",
                            type: 'string',
                          },
                          topicARN: {
                            description: "SNS topic ARN, i.e. arn:aws:sns:us-east-2:698519295917:My-Topic\nIf you don't specify this value, you must specify a value for the PhoneNumber or TargetARN.",
                            type: 'string',
                          },
                        },
                        type: 'object',
                      },
                      type: 'array',
                    },
                    telegramConfigs: {
                      description: 'List of Telegram configurations.',
                      items: {
                        description: 'TelegramConfig configures notifications via Telegram.\nSee https://prometheus.io/docs/alerting/latest/configuration/#telegram_config',
                        properties: {
                          apiURL: {
                            description: 'The Telegram API URL i.e. https://api.telegram.org.\nIf not specified, default API URL will be used.',
                            type: 'string',
                          },
                          botToken: {
                            description: 'Telegram bot token. It is mutually exclusive with `botTokenFile`.\nThe secret needs to be in the same namespace as the AlertmanagerConfig\nobject and accessible by the Prometheus Operator.\n\nEither `botToken` or `botTokenFile` is required.',
                            properties: {
                              key: {
                                description: 'The key of the secret to select from.  Must be a valid secret key.',
                                minLength: 1,
                                type: 'string',
                              },
                              name: {
                                description: "The name of the secret in the object's namespace to select from.",
                                minLength: 1,
                                type: 'string',
                              },
                            },
                            required: [
                              'key',
                              'name',
                            ],
                            type: 'object',
                          },
                          botTokenFile: {
                            description: 'File to read the Telegram bot token from. It is mutually exclusive with `botToken`.\nEither `botToken` or `botTokenFile` is required.\n\nIt requires Alertmanager >= v0.26.0.',
                            type: 'string',
                          },
                          chatID: {
                            description: 'The Telegram chat ID.',
                            format: 'int64',
                            type: 'integer',
                          },
                          disableNotifications: {
                            description: 'Disable telegram notifications',
                            type: 'boolean',
                          },
                          httpConfig: {
                            description: 'HTTP client configuration.',
                            properties: {
                              authorization: {
                                description: 'Authorization header configuration for the client.\nThis is mutually exclusive with BasicAuth and is only available starting from Alertmanager v0.22+.',
                                properties: {
                                  credentials: {
                                    description: 'Selects a key of a Secret in the namespace that contains the credentials for authentication.',
                                    properties: {
                                      key: {
                                        description: 'The key of the secret to select from.  Must be a valid secret key.',
                                        type: 'string',
                                      },
                                      name: {
                                        default: '',
                                        description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                        type: 'string',
                                      },
                                      optional: {
                                        description: 'Specify whether the Secret or its key must be defined',
                                        type: 'boolean',
                                      },
                                    },
                                    required: [
                                      'key',
                                    ],
                                    type: 'object',
                                    'x-kubernetes-map-type': 'atomic',
                                  },
                                  type: {
                                    description: 'Defines the authentication type. The value is case-insensitive.\n\n"Basic" is not a supported value.\n\nDefault: "Bearer"',
                                    type: 'string',
                                  },
                                },
                                type: 'object',
                              },
                              basicAuth: {
                                description: 'BasicAuth for the client.\nThis is mutually exclusive with Authorization. If both are defined, BasicAuth takes precedence.',
                                properties: {
                                  password: {
                                    description: '`password` specifies a key of a Secret containing the password for\nauthentication.',
                                    properties: {
                                      key: {
                                        description: 'The key of the secret to select from.  Must be a valid secret key.',
                                        type: 'string',
                                      },
                                      name: {
                                        default: '',
                                        description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                        type: 'string',
                                      },
                                      optional: {
                                        description: 'Specify whether the Secret or its key must be defined',
                                        type: 'boolean',
                                      },
                                    },
                                    required: [
                                      'key',
                                    ],
                                    type: 'object',
                                    'x-kubernetes-map-type': 'atomic',
                                  },
                                  username: {
                                    description: '`username` specifies a key of a Secret containing the username for\nauthentication.',
                                    properties: {
                                      key: {
                                        description: 'The key of the secret to select from.  Must be a valid secret key.',
                                        type: 'string',
                                      },
                                      name: {
                                        default: '',
                                        description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                        type: 'string',
                                      },
                                      optional: {
                                        description: 'Specify whether the Secret or its key must be defined',
                                        type: 'boolean',
                                      },
                                    },
                                    required: [
                                      'key',
                                    ],
                                    type: 'object',
                                    'x-kubernetes-map-type': 'atomic',
                                  },
                                },
                                type: 'object',
                              },
                              bearerTokenSecret: {
                                description: "The secret's key that contains the bearer token to be used by the client\nfor authentication.\nThe secret needs to be in the same namespace as the AlertmanagerConfig\nobject and accessible by the Prometheus Operator.",
                                properties: {
                                  key: {
                                    description: 'The key of the secret to select from.  Must be a valid secret key.',
                                    minLength: 1,
                                    type: 'string',
                                  },
                                  name: {
                                    description: "The name of the secret in the object's namespace to select from.",
                                    minLength: 1,
                                    type: 'string',
                                  },
                                },
                                required: [
                                  'key',
                                  'name',
                                ],
                                type: 'object',
                              },
                              followRedirects: {
                                description: 'FollowRedirects specifies whether the client should follow HTTP 3xx redirects.',
                                type: 'boolean',
                              },
                              noProxy: {
                                description: '`noProxy` is a comma-separated string that can contain IPs, CIDR notation, domain names\nthat should be excluded from proxying. IP and domain names can\ncontain port numbers.\n\nIt requires Prometheus >= v2.43.0 or Alertmanager >= 0.25.0.',
                                type: 'string',
                              },
                              oauth2: {
                                description: 'OAuth2 client credentials used to fetch a token for the targets.',
                                properties: {
                                  clientId: {
                                    description: "`clientId` specifies a key of a Secret or ConfigMap containing the\nOAuth2 client's ID.",
                                    properties: {
                                      configMap: {
                                        description: 'ConfigMap containing data to use for the targets.',
                                        properties: {
                                          key: {
                                            description: 'The key to select.',
                                            type: 'string',
                                          },
                                          name: {
                                            default: '',
                                            description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                            type: 'string',
                                          },
                                          optional: {
                                            description: 'Specify whether the ConfigMap or its key must be defined',
                                            type: 'boolean',
                                          },
                                        },
                                        required: [
                                          'key',
                                        ],
                                        type: 'object',
                                        'x-kubernetes-map-type': 'atomic',
                                      },
                                      secret: {
                                        description: 'Secret containing data to use for the targets.',
                                        properties: {
                                          key: {
                                            description: 'The key of the secret to select from.  Must be a valid secret key.',
                                            type: 'string',
                                          },
                                          name: {
                                            default: '',
                                            description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                            type: 'string',
                                          },
                                          optional: {
                                            description: 'Specify whether the Secret or its key must be defined',
                                            type: 'boolean',
                                          },
                                        },
                                        required: [
                                          'key',
                                        ],
                                        type: 'object',
                                        'x-kubernetes-map-type': 'atomic',
                                      },
                                    },
                                    type: 'object',
                                  },
                                  clientSecret: {
                                    description: "`clientSecret` specifies a key of a Secret containing the OAuth2\nclient's secret.",
                                    properties: {
                                      key: {
                                        description: 'The key of the secret to select from.  Must be a valid secret key.',
                                        type: 'string',
                                      },
                                      name: {
                                        default: '',
                                        description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                        type: 'string',
                                      },
                                      optional: {
                                        description: 'Specify whether the Secret or its key must be defined',
                                        type: 'boolean',
                                      },
                                    },
                                    required: [
                                      'key',
                                    ],
                                    type: 'object',
                                    'x-kubernetes-map-type': 'atomic',
                                  },
                                  endpointParams: {
                                    additionalProperties: {
                                      type: 'string',
                                    },
                                    description: '`endpointParams` configures the HTTP parameters to append to the token\nURL.',
                                    type: 'object',
                                  },
                                  noProxy: {
                                    description: '`noProxy` is a comma-separated string that can contain IPs, CIDR notation, domain names\nthat should be excluded from proxying. IP and domain names can\ncontain port numbers.\n\nIt requires Prometheus >= v2.43.0 or Alertmanager >= 0.25.0.',
                                    type: 'string',
                                  },
                                  proxyConnectHeader: {
                                    additionalProperties: {
                                      items: {
                                        description: 'SecretKeySelector selects a key of a Secret.',
                                        properties: {
                                          key: {
                                            description: 'The key of the secret to select from.  Must be a valid secret key.',
                                            type: 'string',
                                          },
                                          name: {
                                            default: '',
                                            description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                            type: 'string',
                                          },
                                          optional: {
                                            description: 'Specify whether the Secret or its key must be defined',
                                            type: 'boolean',
                                          },
                                        },
                                        required: [
                                          'key',
                                        ],
                                        type: 'object',
                                        'x-kubernetes-map-type': 'atomic',
                                      },
                                      type: 'array',
                                    },
                                    description: 'ProxyConnectHeader optionally specifies headers to send to\nproxies during CONNECT requests.\n\nIt requires Prometheus >= v2.43.0 or Alertmanager >= 0.25.0.',
                                    type: 'object',
                                    'x-kubernetes-map-type': 'atomic',
                                  },
                                  proxyFromEnvironment: {
                                    description: 'Whether to use the proxy configuration defined by environment variables (HTTP_PROXY, HTTPS_PROXY, and NO_PROXY).\n\nIt requires Prometheus >= v2.43.0 or Alertmanager >= 0.25.0.',
                                    type: 'boolean',
                                  },
                                  proxyUrl: {
                                    description: '`proxyURL` defines the HTTP proxy server to use.',
                                    pattern: '^http(s)?://.+$',
                                    type: 'string',
                                  },
                                  scopes: {
                                    description: '`scopes` defines the OAuth2 scopes used for the token request.',
                                    items: {
                                      type: 'string',
                                    },
                                    type: 'array',
                                  },
                                  tlsConfig: {
                                    description: 'TLS configuration to use when connecting to the OAuth2 server.\nIt requires Prometheus >= v2.43.0.',
                                    properties: {
                                      ca: {
                                        description: 'Certificate authority used when verifying server certificates.',
                                        properties: {
                                          configMap: {
                                            description: 'ConfigMap containing data to use for the targets.',
                                            properties: {
                                              key: {
                                                description: 'The key to select.',
                                                type: 'string',
                                              },
                                              name: {
                                                default: '',
                                                description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                                type: 'string',
                                              },
                                              optional: {
                                                description: 'Specify whether the ConfigMap or its key must be defined',
                                                type: 'boolean',
                                              },
                                            },
                                            required: [
                                              'key',
                                            ],
                                            type: 'object',
                                            'x-kubernetes-map-type': 'atomic',
                                          },
                                          secret: {
                                            description: 'Secret containing data to use for the targets.',
                                            properties: {
                                              key: {
                                                description: 'The key of the secret to select from.  Must be a valid secret key.',
                                                type: 'string',
                                              },
                                              name: {
                                                default: '',
                                                description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                                type: 'string',
                                              },
                                              optional: {
                                                description: 'Specify whether the Secret or its key must be defined',
                                                type: 'boolean',
                                              },
                                            },
                                            required: [
                                              'key',
                                            ],
                                            type: 'object',
                                            'x-kubernetes-map-type': 'atomic',
                                          },
                                        },
                                        type: 'object',
                                      },
                                      cert: {
                                        description: 'Client certificate to present when doing client-authentication.',
                                        properties: {
                                          configMap: {
                                            description: 'ConfigMap containing data to use for the targets.',
                                            properties: {
                                              key: {
                                                description: 'The key to select.',
                                                type: 'string',
                                              },
                                              name: {
                                                default: '',
                                                description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                                type: 'string',
                                              },
                                              optional: {
                                                description: 'Specify whether the ConfigMap or its key must be defined',
                                                type: 'boolean',
                                              },
                                            },
                                            required: [
                                              'key',
                                            ],
                                            type: 'object',
                                            'x-kubernetes-map-type': 'atomic',
                                          },
                                          secret: {
                                            description: 'Secret containing data to use for the targets.',
                                            properties: {
                                              key: {
                                                description: 'The key of the secret to select from.  Must be a valid secret key.',
                                                type: 'string',
                                              },
                                              name: {
                                                default: '',
                                                description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                                type: 'string',
                                              },
                                              optional: {
                                                description: 'Specify whether the Secret or its key must be defined',
                                                type: 'boolean',
                                              },
                                            },
                                            required: [
                                              'key',
                                            ],
                                            type: 'object',
                                            'x-kubernetes-map-type': 'atomic',
                                          },
                                        },
                                        type: 'object',
                                      },
                                      insecureSkipVerify: {
                                        description: 'Disable target certificate validation.',
                                        type: 'boolean',
                                      },
                                      keySecret: {
                                        description: 'Secret containing the client key file for the targets.',
                                        properties: {
                                          key: {
                                            description: 'The key of the secret to select from.  Must be a valid secret key.',
                                            type: 'string',
                                          },
                                          name: {
                                            default: '',
                                            description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                            type: 'string',
                                          },
                                          optional: {
                                            description: 'Specify whether the Secret or its key must be defined',
                                            type: 'boolean',
                                          },
                                        },
                                        required: [
                                          'key',
                                        ],
                                        type: 'object',
                                        'x-kubernetes-map-type': 'atomic',
                                      },
                                      maxVersion: {
                                        description: 'Maximum acceptable TLS version.\n\nIt requires Prometheus >= v2.41.0.',
                                        enum: [
                                          'TLS10',
                                          'TLS11',
                                          'TLS12',
                                          'TLS13',
                                        ],
                                        type: 'string',
                                      },
                                      minVersion: {
                                        description: 'Minimum acceptable TLS version.\n\nIt requires Prometheus >= v2.35.0.',
                                        enum: [
                                          'TLS10',
                                          'TLS11',
                                          'TLS12',
                                          'TLS13',
                                        ],
                                        type: 'string',
                                      },
                                      serverName: {
                                        description: 'Used to verify the hostname for the targets.',
                                        type: 'string',
                                      },
                                    },
                                    type: 'object',
                                  },
                                  tokenUrl: {
                                    description: '`tokenURL` configures the URL to fetch the token from.',
                                    minLength: 1,
                                    type: 'string',
                                  },
                                },
                                required: [
                                  'clientId',
                                  'clientSecret',
                                  'tokenUrl',
                                ],
                                type: 'object',
                              },
                              proxyConnectHeader: {
                                additionalProperties: {
                                  items: {
                                    description: 'SecretKeySelector selects a key of a Secret.',
                                    properties: {
                                      key: {
                                        description: 'The key of the secret to select from.  Must be a valid secret key.',
                                        type: 'string',
                                      },
                                      name: {
                                        default: '',
                                        description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                        type: 'string',
                                      },
                                      optional: {
                                        description: 'Specify whether the Secret or its key must be defined',
                                        type: 'boolean',
                                      },
                                    },
                                    required: [
                                      'key',
                                    ],
                                    type: 'object',
                                    'x-kubernetes-map-type': 'atomic',
                                  },
                                  type: 'array',
                                },
                                description: 'ProxyConnectHeader optionally specifies headers to send to\nproxies during CONNECT requests.\n\nIt requires Prometheus >= v2.43.0 or Alertmanager >= 0.25.0.',
                                type: 'object',
                                'x-kubernetes-map-type': 'atomic',
                              },
                              proxyFromEnvironment: {
                                description: 'Whether to use the proxy configuration defined by environment variables (HTTP_PROXY, HTTPS_PROXY, and NO_PROXY).\n\nIt requires Prometheus >= v2.43.0 or Alertmanager >= 0.25.0.',
                                type: 'boolean',
                              },
                              proxyURL: {
                                description: 'Optional proxy URL.\n\nIf defined, this field takes precedence over `proxyUrl`.',
                                type: 'string',
                              },
                              proxyUrl: {
                                description: '`proxyURL` defines the HTTP proxy server to use.',
                                pattern: '^http(s)?://.+$',
                                type: 'string',
                              },
                              tlsConfig: {
                                description: 'TLS configuration for the client.',
                                properties: {
                                  ca: {
                                    description: 'Certificate authority used when verifying server certificates.',
                                    properties: {
                                      configMap: {
                                        description: 'ConfigMap containing data to use for the targets.',
                                        properties: {
                                          key: {
                                            description: 'The key to select.',
                                            type: 'string',
                                          },
                                          name: {
                                            default: '',
                                            description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                            type: 'string',
                                          },
                                          optional: {
                                            description: 'Specify whether the ConfigMap or its key must be defined',
                                            type: 'boolean',
                                          },
                                        },
                                        required: [
                                          'key',
                                        ],
                                        type: 'object',
                                        'x-kubernetes-map-type': 'atomic',
                                      },
                                      secret: {
                                        description: 'Secret containing data to use for the targets.',
                                        properties: {
                                          key: {
                                            description: 'The key of the secret to select from.  Must be a valid secret key.',
                                            type: 'string',
                                          },
                                          name: {
                                            default: '',
                                            description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                            type: 'string',
                                          },
                                          optional: {
                                            description: 'Specify whether the Secret or its key must be defined',
                                            type: 'boolean',
                                          },
                                        },
                                        required: [
                                          'key',
                                        ],
                                        type: 'object',
                                        'x-kubernetes-map-type': 'atomic',
                                      },
                                    },
                                    type: 'object',
                                  },
                                  cert: {
                                    description: 'Client certificate to present when doing client-authentication.',
                                    properties: {
                                      configMap: {
                                        description: 'ConfigMap containing data to use for the targets.',
                                        properties: {
                                          key: {
                                            description: 'The key to select.',
                                            type: 'string',
                                          },
                                          name: {
                                            default: '',
                                            description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                            type: 'string',
                                          },
                                          optional: {
                                            description: 'Specify whether the ConfigMap or its key must be defined',
                                            type: 'boolean',
                                          },
                                        },
                                        required: [
                                          'key',
                                        ],
                                        type: 'object',
                                        'x-kubernetes-map-type': 'atomic',
                                      },
                                      secret: {
                                        description: 'Secret containing data to use for the targets.',
                                        properties: {
                                          key: {
                                            description: 'The key of the secret to select from.  Must be a valid secret key.',
                                            type: 'string',
                                          },
                                          name: {
                                            default: '',
                                            description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                            type: 'string',
                                          },
                                          optional: {
                                            description: 'Specify whether the Secret or its key must be defined',
                                            type: 'boolean',
                                          },
                                        },
                                        required: [
                                          'key',
                                        ],
                                        type: 'object',
                                        'x-kubernetes-map-type': 'atomic',
                                      },
                                    },
                                    type: 'object',
                                  },
                                  insecureSkipVerify: {
                                    description: 'Disable target certificate validation.',
                                    type: 'boolean',
                                  },
                                  keySecret: {
                                    description: 'Secret containing the client key file for the targets.',
                                    properties: {
                                      key: {
                                        description: 'The key of the secret to select from.  Must be a valid secret key.',
                                        type: 'string',
                                      },
                                      name: {
                                        default: '',
                                        description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                        type: 'string',
                                      },
                                      optional: {
                                        description: 'Specify whether the Secret or its key must be defined',
                                        type: 'boolean',
                                      },
                                    },
                                    required: [
                                      'key',
                                    ],
                                    type: 'object',
                                    'x-kubernetes-map-type': 'atomic',
                                  },
                                  maxVersion: {
                                    description: 'Maximum acceptable TLS version.\n\nIt requires Prometheus >= v2.41.0.',
                                    enum: [
                                      'TLS10',
                                      'TLS11',
                                      'TLS12',
                                      'TLS13',
                                    ],
                                    type: 'string',
                                  },
                                  minVersion: {
                                    description: 'Minimum acceptable TLS version.\n\nIt requires Prometheus >= v2.35.0.',
                                    enum: [
                                      'TLS10',
                                      'TLS11',
                                      'TLS12',
                                      'TLS13',
                                    ],
                                    type: 'string',
                                  },
                                  serverName: {
                                    description: 'Used to verify the hostname for the targets.',
                                    type: 'string',
                                  },
                                },
                                type: 'object',
                              },
                            },
                            type: 'object',
                          },
                          message: {
                            description: 'Message template',
                            type: 'string',
                          },
                          messageThreadID: {
                            description: 'The Telegram Group Topic ID.\nIt requires Alertmanager >= 0.26.0.',
                            format: 'int64',
                            type: 'integer',
                          },
                          parseMode: {
                            description: 'Parse mode for telegram message',
                            enum: [
                              'MarkdownV2',
                              'Markdown',
                              'HTML',
                            ],
                            type: 'string',
                          },
                          sendResolved: {
                            description: 'Whether to notify about resolved alerts.',
                            type: 'boolean',
                          },
                        },
                        required: [
                          'chatID',
                        ],
                        type: 'object',
                      },
                      type: 'array',
                    },
                    victoropsConfigs: {
                      description: 'List of VictorOps configurations.',
                      items: {
                        description: 'VictorOpsConfig configures notifications via VictorOps.\nSee https://prometheus.io/docs/alerting/latest/configuration/#victorops_config',
                        properties: {
                          apiKey: {
                            description: "The secret's key that contains the API key to use when talking to the VictorOps API.\nThe secret needs to be in the same namespace as the AlertmanagerConfig\nobject and accessible by the Prometheus Operator.",
                            properties: {
                              key: {
                                description: 'The key of the secret to select from.  Must be a valid secret key.',
                                minLength: 1,
                                type: 'string',
                              },
                              name: {
                                description: "The name of the secret in the object's namespace to select from.",
                                minLength: 1,
                                type: 'string',
                              },
                            },
                            required: [
                              'key',
                              'name',
                            ],
                            type: 'object',
                          },
                          apiUrl: {
                            description: 'The VictorOps API URL.',
                            type: 'string',
                          },
                          customFields: {
                            description: 'Additional custom fields for notification.',
                            items: {
                              description: 'KeyValue defines a (key, value) tuple.',
                              properties: {
                                key: {
                                  description: 'Key of the tuple.',
                                  minLength: 1,
                                  type: 'string',
                                },
                                value: {
                                  description: 'Value of the tuple.',
                                  type: 'string',
                                },
                              },
                              required: [
                                'key',
                                'value',
                              ],
                              type: 'object',
                            },
                            type: 'array',
                          },
                          entityDisplayName: {
                            description: 'Contains summary of the alerted problem.',
                            type: 'string',
                          },
                          httpConfig: {
                            description: "The HTTP client's configuration.",
                            properties: {
                              authorization: {
                                description: 'Authorization header configuration for the client.\nThis is mutually exclusive with BasicAuth and is only available starting from Alertmanager v0.22+.',
                                properties: {
                                  credentials: {
                                    description: 'Selects a key of a Secret in the namespace that contains the credentials for authentication.',
                                    properties: {
                                      key: {
                                        description: 'The key of the secret to select from.  Must be a valid secret key.',
                                        type: 'string',
                                      },
                                      name: {
                                        default: '',
                                        description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                        type: 'string',
                                      },
                                      optional: {
                                        description: 'Specify whether the Secret or its key must be defined',
                                        type: 'boolean',
                                      },
                                    },
                                    required: [
                                      'key',
                                    ],
                                    type: 'object',
                                    'x-kubernetes-map-type': 'atomic',
                                  },
                                  type: {
                                    description: 'Defines the authentication type. The value is case-insensitive.\n\n"Basic" is not a supported value.\n\nDefault: "Bearer"',
                                    type: 'string',
                                  },
                                },
                                type: 'object',
                              },
                              basicAuth: {
                                description: 'BasicAuth for the client.\nThis is mutually exclusive with Authorization. If both are defined, BasicAuth takes precedence.',
                                properties: {
                                  password: {
                                    description: '`password` specifies a key of a Secret containing the password for\nauthentication.',
                                    properties: {
                                      key: {
                                        description: 'The key of the secret to select from.  Must be a valid secret key.',
                                        type: 'string',
                                      },
                                      name: {
                                        default: '',
                                        description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                        type: 'string',
                                      },
                                      optional: {
                                        description: 'Specify whether the Secret or its key must be defined',
                                        type: 'boolean',
                                      },
                                    },
                                    required: [
                                      'key',
                                    ],
                                    type: 'object',
                                    'x-kubernetes-map-type': 'atomic',
                                  },
                                  username: {
                                    description: '`username` specifies a key of a Secret containing the username for\nauthentication.',
                                    properties: {
                                      key: {
                                        description: 'The key of the secret to select from.  Must be a valid secret key.',
                                        type: 'string',
                                      },
                                      name: {
                                        default: '',
                                        description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                        type: 'string',
                                      },
                                      optional: {
                                        description: 'Specify whether the Secret or its key must be defined',
                                        type: 'boolean',
                                      },
                                    },
                                    required: [
                                      'key',
                                    ],
                                    type: 'object',
                                    'x-kubernetes-map-type': 'atomic',
                                  },
                                },
                                type: 'object',
                              },
                              bearerTokenSecret: {
                                description: "The secret's key that contains the bearer token to be used by the client\nfor authentication.\nThe secret needs to be in the same namespace as the AlertmanagerConfig\nobject and accessible by the Prometheus Operator.",
                                properties: {
                                  key: {
                                    description: 'The key of the secret to select from.  Must be a valid secret key.',
                                    minLength: 1,
                                    type: 'string',
                                  },
                                  name: {
                                    description: "The name of the secret in the object's namespace to select from.",
                                    minLength: 1,
                                    type: 'string',
                                  },
                                },
                                required: [
                                  'key',
                                  'name',
                                ],
                                type: 'object',
                              },
                              followRedirects: {
                                description: 'FollowRedirects specifies whether the client should follow HTTP 3xx redirects.',
                                type: 'boolean',
                              },
                              noProxy: {
                                description: '`noProxy` is a comma-separated string that can contain IPs, CIDR notation, domain names\nthat should be excluded from proxying. IP and domain names can\ncontain port numbers.\n\nIt requires Prometheus >= v2.43.0 or Alertmanager >= 0.25.0.',
                                type: 'string',
                              },
                              oauth2: {
                                description: 'OAuth2 client credentials used to fetch a token for the targets.',
                                properties: {
                                  clientId: {
                                    description: "`clientId` specifies a key of a Secret or ConfigMap containing the\nOAuth2 client's ID.",
                                    properties: {
                                      configMap: {
                                        description: 'ConfigMap containing data to use for the targets.',
                                        properties: {
                                          key: {
                                            description: 'The key to select.',
                                            type: 'string',
                                          },
                                          name: {
                                            default: '',
                                            description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                            type: 'string',
                                          },
                                          optional: {
                                            description: 'Specify whether the ConfigMap or its key must be defined',
                                            type: 'boolean',
                                          },
                                        },
                                        required: [
                                          'key',
                                        ],
                                        type: 'object',
                                        'x-kubernetes-map-type': 'atomic',
                                      },
                                      secret: {
                                        description: 'Secret containing data to use for the targets.',
                                        properties: {
                                          key: {
                                            description: 'The key of the secret to select from.  Must be a valid secret key.',
                                            type: 'string',
                                          },
                                          name: {
                                            default: '',
                                            description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                            type: 'string',
                                          },
                                          optional: {
                                            description: 'Specify whether the Secret or its key must be defined',
                                            type: 'boolean',
                                          },
                                        },
                                        required: [
                                          'key',
                                        ],
                                        type: 'object',
                                        'x-kubernetes-map-type': 'atomic',
                                      },
                                    },
                                    type: 'object',
                                  },
                                  clientSecret: {
                                    description: "`clientSecret` specifies a key of a Secret containing the OAuth2\nclient's secret.",
                                    properties: {
                                      key: {
                                        description: 'The key of the secret to select from.  Must be a valid secret key.',
                                        type: 'string',
                                      },
                                      name: {
                                        default: '',
                                        description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                        type: 'string',
                                      },
                                      optional: {
                                        description: 'Specify whether the Secret or its key must be defined',
                                        type: 'boolean',
                                      },
                                    },
                                    required: [
                                      'key',
                                    ],
                                    type: 'object',
                                    'x-kubernetes-map-type': 'atomic',
                                  },
                                  endpointParams: {
                                    additionalProperties: {
                                      type: 'string',
                                    },
                                    description: '`endpointParams` configures the HTTP parameters to append to the token\nURL.',
                                    type: 'object',
                                  },
                                  noProxy: {
                                    description: '`noProxy` is a comma-separated string that can contain IPs, CIDR notation, domain names\nthat should be excluded from proxying. IP and domain names can\ncontain port numbers.\n\nIt requires Prometheus >= v2.43.0 or Alertmanager >= 0.25.0.',
                                    type: 'string',
                                  },
                                  proxyConnectHeader: {
                                    additionalProperties: {
                                      items: {
                                        description: 'SecretKeySelector selects a key of a Secret.',
                                        properties: {
                                          key: {
                                            description: 'The key of the secret to select from.  Must be a valid secret key.',
                                            type: 'string',
                                          },
                                          name: {
                                            default: '',
                                            description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                            type: 'string',
                                          },
                                          optional: {
                                            description: 'Specify whether the Secret or its key must be defined',
                                            type: 'boolean',
                                          },
                                        },
                                        required: [
                                          'key',
                                        ],
                                        type: 'object',
                                        'x-kubernetes-map-type': 'atomic',
                                      },
                                      type: 'array',
                                    },
                                    description: 'ProxyConnectHeader optionally specifies headers to send to\nproxies during CONNECT requests.\n\nIt requires Prometheus >= v2.43.0 or Alertmanager >= 0.25.0.',
                                    type: 'object',
                                    'x-kubernetes-map-type': 'atomic',
                                  },
                                  proxyFromEnvironment: {
                                    description: 'Whether to use the proxy configuration defined by environment variables (HTTP_PROXY, HTTPS_PROXY, and NO_PROXY).\n\nIt requires Prometheus >= v2.43.0 or Alertmanager >= 0.25.0.',
                                    type: 'boolean',
                                  },
                                  proxyUrl: {
                                    description: '`proxyURL` defines the HTTP proxy server to use.',
                                    pattern: '^http(s)?://.+$',
                                    type: 'string',
                                  },
                                  scopes: {
                                    description: '`scopes` defines the OAuth2 scopes used for the token request.',
                                    items: {
                                      type: 'string',
                                    },
                                    type: 'array',
                                  },
                                  tlsConfig: {
                                    description: 'TLS configuration to use when connecting to the OAuth2 server.\nIt requires Prometheus >= v2.43.0.',
                                    properties: {
                                      ca: {
                                        description: 'Certificate authority used when verifying server certificates.',
                                        properties: {
                                          configMap: {
                                            description: 'ConfigMap containing data to use for the targets.',
                                            properties: {
                                              key: {
                                                description: 'The key to select.',
                                                type: 'string',
                                              },
                                              name: {
                                                default: '',
                                                description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                                type: 'string',
                                              },
                                              optional: {
                                                description: 'Specify whether the ConfigMap or its key must be defined',
                                                type: 'boolean',
                                              },
                                            },
                                            required: [
                                              'key',
                                            ],
                                            type: 'object',
                                            'x-kubernetes-map-type': 'atomic',
                                          },
                                          secret: {
                                            description: 'Secret containing data to use for the targets.',
                                            properties: {
                                              key: {
                                                description: 'The key of the secret to select from.  Must be a valid secret key.',
                                                type: 'string',
                                              },
                                              name: {
                                                default: '',
                                                description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                                type: 'string',
                                              },
                                              optional: {
                                                description: 'Specify whether the Secret or its key must be defined',
                                                type: 'boolean',
                                              },
                                            },
                                            required: [
                                              'key',
                                            ],
                                            type: 'object',
                                            'x-kubernetes-map-type': 'atomic',
                                          },
                                        },
                                        type: 'object',
                                      },
                                      cert: {
                                        description: 'Client certificate to present when doing client-authentication.',
                                        properties: {
                                          configMap: {
                                            description: 'ConfigMap containing data to use for the targets.',
                                            properties: {
                                              key: {
                                                description: 'The key to select.',
                                                type: 'string',
                                              },
                                              name: {
                                                default: '',
                                                description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                                type: 'string',
                                              },
                                              optional: {
                                                description: 'Specify whether the ConfigMap or its key must be defined',
                                                type: 'boolean',
                                              },
                                            },
                                            required: [
                                              'key',
                                            ],
                                            type: 'object',
                                            'x-kubernetes-map-type': 'atomic',
                                          },
                                          secret: {
                                            description: 'Secret containing data to use for the targets.',
                                            properties: {
                                              key: {
                                                description: 'The key of the secret to select from.  Must be a valid secret key.',
                                                type: 'string',
                                              },
                                              name: {
                                                default: '',
                                                description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                                type: 'string',
                                              },
                                              optional: {
                                                description: 'Specify whether the Secret or its key must be defined',
                                                type: 'boolean',
                                              },
                                            },
                                            required: [
                                              'key',
                                            ],
                                            type: 'object',
                                            'x-kubernetes-map-type': 'atomic',
                                          },
                                        },
                                        type: 'object',
                                      },
                                      insecureSkipVerify: {
                                        description: 'Disable target certificate validation.',
                                        type: 'boolean',
                                      },
                                      keySecret: {
                                        description: 'Secret containing the client key file for the targets.',
                                        properties: {
                                          key: {
                                            description: 'The key of the secret to select from.  Must be a valid secret key.',
                                            type: 'string',
                                          },
                                          name: {
                                            default: '',
                                            description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                            type: 'string',
                                          },
                                          optional: {
                                            description: 'Specify whether the Secret or its key must be defined',
                                            type: 'boolean',
                                          },
                                        },
                                        required: [
                                          'key',
                                        ],
                                        type: 'object',
                                        'x-kubernetes-map-type': 'atomic',
                                      },
                                      maxVersion: {
                                        description: 'Maximum acceptable TLS version.\n\nIt requires Prometheus >= v2.41.0.',
                                        enum: [
                                          'TLS10',
                                          'TLS11',
                                          'TLS12',
                                          'TLS13',
                                        ],
                                        type: 'string',
                                      },
                                      minVersion: {
                                        description: 'Minimum acceptable TLS version.\n\nIt requires Prometheus >= v2.35.0.',
                                        enum: [
                                          'TLS10',
                                          'TLS11',
                                          'TLS12',
                                          'TLS13',
                                        ],
                                        type: 'string',
                                      },
                                      serverName: {
                                        description: 'Used to verify the hostname for the targets.',
                                        type: 'string',
                                      },
                                    },
                                    type: 'object',
                                  },
                                  tokenUrl: {
                                    description: '`tokenURL` configures the URL to fetch the token from.',
                                    minLength: 1,
                                    type: 'string',
                                  },
                                },
                                required: [
                                  'clientId',
                                  'clientSecret',
                                  'tokenUrl',
                                ],
                                type: 'object',
                              },
                              proxyConnectHeader: {
                                additionalProperties: {
                                  items: {
                                    description: 'SecretKeySelector selects a key of a Secret.',
                                    properties: {
                                      key: {
                                        description: 'The key of the secret to select from.  Must be a valid secret key.',
                                        type: 'string',
                                      },
                                      name: {
                                        default: '',
                                        description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                        type: 'string',
                                      },
                                      optional: {
                                        description: 'Specify whether the Secret or its key must be defined',
                                        type: 'boolean',
                                      },
                                    },
                                    required: [
                                      'key',
                                    ],
                                    type: 'object',
                                    'x-kubernetes-map-type': 'atomic',
                                  },
                                  type: 'array',
                                },
                                description: 'ProxyConnectHeader optionally specifies headers to send to\nproxies during CONNECT requests.\n\nIt requires Prometheus >= v2.43.0 or Alertmanager >= 0.25.0.',
                                type: 'object',
                                'x-kubernetes-map-type': 'atomic',
                              },
                              proxyFromEnvironment: {
                                description: 'Whether to use the proxy configuration defined by environment variables (HTTP_PROXY, HTTPS_PROXY, and NO_PROXY).\n\nIt requires Prometheus >= v2.43.0 or Alertmanager >= 0.25.0.',
                                type: 'boolean',
                              },
                              proxyURL: {
                                description: 'Optional proxy URL.\n\nIf defined, this field takes precedence over `proxyUrl`.',
                                type: 'string',
                              },
                              proxyUrl: {
                                description: '`proxyURL` defines the HTTP proxy server to use.',
                                pattern: '^http(s)?://.+$',
                                type: 'string',
                              },
                              tlsConfig: {
                                description: 'TLS configuration for the client.',
                                properties: {
                                  ca: {
                                    description: 'Certificate authority used when verifying server certificates.',
                                    properties: {
                                      configMap: {
                                        description: 'ConfigMap containing data to use for the targets.',
                                        properties: {
                                          key: {
                                            description: 'The key to select.',
                                            type: 'string',
                                          },
                                          name: {
                                            default: '',
                                            description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                            type: 'string',
                                          },
                                          optional: {
                                            description: 'Specify whether the ConfigMap or its key must be defined',
                                            type: 'boolean',
                                          },
                                        },
                                        required: [
                                          'key',
                                        ],
                                        type: 'object',
                                        'x-kubernetes-map-type': 'atomic',
                                      },
                                      secret: {
                                        description: 'Secret containing data to use for the targets.',
                                        properties: {
                                          key: {
                                            description: 'The key of the secret to select from.  Must be a valid secret key.',
                                            type: 'string',
                                          },
                                          name: {
                                            default: '',
                                            description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                            type: 'string',
                                          },
                                          optional: {
                                            description: 'Specify whether the Secret or its key must be defined',
                                            type: 'boolean',
                                          },
                                        },
                                        required: [
                                          'key',
                                        ],
                                        type: 'object',
                                        'x-kubernetes-map-type': 'atomic',
                                      },
                                    },
                                    type: 'object',
                                  },
                                  cert: {
                                    description: 'Client certificate to present when doing client-authentication.',
                                    properties: {
                                      configMap: {
                                        description: 'ConfigMap containing data to use for the targets.',
                                        properties: {
                                          key: {
                                            description: 'The key to select.',
                                            type: 'string',
                                          },
                                          name: {
                                            default: '',
                                            description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                            type: 'string',
                                          },
                                          optional: {
                                            description: 'Specify whether the ConfigMap or its key must be defined',
                                            type: 'boolean',
                                          },
                                        },
                                        required: [
                                          'key',
                                        ],
                                        type: 'object',
                                        'x-kubernetes-map-type': 'atomic',
                                      },
                                      secret: {
                                        description: 'Secret containing data to use for the targets.',
                                        properties: {
                                          key: {
                                            description: 'The key of the secret to select from.  Must be a valid secret key.',
                                            type: 'string',
                                          },
                                          name: {
                                            default: '',
                                            description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                            type: 'string',
                                          },
                                          optional: {
                                            description: 'Specify whether the Secret or its key must be defined',
                                            type: 'boolean',
                                          },
                                        },
                                        required: [
                                          'key',
                                        ],
                                        type: 'object',
                                        'x-kubernetes-map-type': 'atomic',
                                      },
                                    },
                                    type: 'object',
                                  },
                                  insecureSkipVerify: {
                                    description: 'Disable target certificate validation.',
                                    type: 'boolean',
                                  },
                                  keySecret: {
                                    description: 'Secret containing the client key file for the targets.',
                                    properties: {
                                      key: {
                                        description: 'The key of the secret to select from.  Must be a valid secret key.',
                                        type: 'string',
                                      },
                                      name: {
                                        default: '',
                                        description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                        type: 'string',
                                      },
                                      optional: {
                                        description: 'Specify whether the Secret or its key must be defined',
                                        type: 'boolean',
                                      },
                                    },
                                    required: [
                                      'key',
                                    ],
                                    type: 'object',
                                    'x-kubernetes-map-type': 'atomic',
                                  },
                                  maxVersion: {
                                    description: 'Maximum acceptable TLS version.\n\nIt requires Prometheus >= v2.41.0.',
                                    enum: [
                                      'TLS10',
                                      'TLS11',
                                      'TLS12',
                                      'TLS13',
                                    ],
                                    type: 'string',
                                  },
                                  minVersion: {
                                    description: 'Minimum acceptable TLS version.\n\nIt requires Prometheus >= v2.35.0.',
                                    enum: [
                                      'TLS10',
                                      'TLS11',
                                      'TLS12',
                                      'TLS13',
                                    ],
                                    type: 'string',
                                  },
                                  serverName: {
                                    description: 'Used to verify the hostname for the targets.',
                                    type: 'string',
                                  },
                                },
                                type: 'object',
                              },
                            },
                            type: 'object',
                          },
                          messageType: {
                            description: 'Describes the behavior of the alert (CRITICAL, WARNING, INFO).',
                            type: 'string',
                          },
                          monitoringTool: {
                            description: 'The monitoring tool the state message is from.',
                            type: 'string',
                          },
                          routingKey: {
                            description: 'A key used to map the alert to a team.',
                            type: 'string',
                          },
                          sendResolved: {
                            description: 'Whether or not to notify about resolved alerts.',
                            type: 'boolean',
                          },
                          stateMessage: {
                            description: 'Contains long explanation of the alerted problem.',
                            type: 'string',
                          },
                        },
                        type: 'object',
                      },
                      type: 'array',
                    },
                    webexConfigs: {
                      description: 'List of Webex configurations.',
                      items: {
                        description: 'WebexConfig configures notification via Cisco Webex\nSee https://prometheus.io/docs/alerting/latest/configuration/#webex_config',
                        properties: {
                          apiURL: {
                            description: 'The Webex Teams API URL i.e. https://webexapis.com/v1/messages',
                            pattern: '^https?://.+$',
                            type: 'string',
                          },
                          httpConfig: {
                            description: "The HTTP client's configuration.\nYou must use this configuration to supply the bot token as part of the HTTP `Authorization` header.",
                            properties: {
                              authorization: {
                                description: 'Authorization header configuration for the client.\nThis is mutually exclusive with BasicAuth and is only available starting from Alertmanager v0.22+.',
                                properties: {
                                  credentials: {
                                    description: 'Selects a key of a Secret in the namespace that contains the credentials for authentication.',
                                    properties: {
                                      key: {
                                        description: 'The key of the secret to select from.  Must be a valid secret key.',
                                        type: 'string',
                                      },
                                      name: {
                                        default: '',
                                        description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                        type: 'string',
                                      },
                                      optional: {
                                        description: 'Specify whether the Secret or its key must be defined',
                                        type: 'boolean',
                                      },
                                    },
                                    required: [
                                      'key',
                                    ],
                                    type: 'object',
                                    'x-kubernetes-map-type': 'atomic',
                                  },
                                  type: {
                                    description: 'Defines the authentication type. The value is case-insensitive.\n\n"Basic" is not a supported value.\n\nDefault: "Bearer"',
                                    type: 'string',
                                  },
                                },
                                type: 'object',
                              },
                              basicAuth: {
                                description: 'BasicAuth for the client.\nThis is mutually exclusive with Authorization. If both are defined, BasicAuth takes precedence.',
                                properties: {
                                  password: {
                                    description: '`password` specifies a key of a Secret containing the password for\nauthentication.',
                                    properties: {
                                      key: {
                                        description: 'The key of the secret to select from.  Must be a valid secret key.',
                                        type: 'string',
                                      },
                                      name: {
                                        default: '',
                                        description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                        type: 'string',
                                      },
                                      optional: {
                                        description: 'Specify whether the Secret or its key must be defined',
                                        type: 'boolean',
                                      },
                                    },
                                    required: [
                                      'key',
                                    ],
                                    type: 'object',
                                    'x-kubernetes-map-type': 'atomic',
                                  },
                                  username: {
                                    description: '`username` specifies a key of a Secret containing the username for\nauthentication.',
                                    properties: {
                                      key: {
                                        description: 'The key of the secret to select from.  Must be a valid secret key.',
                                        type: 'string',
                                      },
                                      name: {
                                        default: '',
                                        description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                        type: 'string',
                                      },
                                      optional: {
                                        description: 'Specify whether the Secret or its key must be defined',
                                        type: 'boolean',
                                      },
                                    },
                                    required: [
                                      'key',
                                    ],
                                    type: 'object',
                                    'x-kubernetes-map-type': 'atomic',
                                  },
                                },
                                type: 'object',
                              },
                              bearerTokenSecret: {
                                description: "The secret's key that contains the bearer token to be used by the client\nfor authentication.\nThe secret needs to be in the same namespace as the AlertmanagerConfig\nobject and accessible by the Prometheus Operator.",
                                properties: {
                                  key: {
                                    description: 'The key of the secret to select from.  Must be a valid secret key.',
                                    minLength: 1,
                                    type: 'string',
                                  },
                                  name: {
                                    description: "The name of the secret in the object's namespace to select from.",
                                    minLength: 1,
                                    type: 'string',
                                  },
                                },
                                required: [
                                  'key',
                                  'name',
                                ],
                                type: 'object',
                              },
                              followRedirects: {
                                description: 'FollowRedirects specifies whether the client should follow HTTP 3xx redirects.',
                                type: 'boolean',
                              },
                              noProxy: {
                                description: '`noProxy` is a comma-separated string that can contain IPs, CIDR notation, domain names\nthat should be excluded from proxying. IP and domain names can\ncontain port numbers.\n\nIt requires Prometheus >= v2.43.0 or Alertmanager >= 0.25.0.',
                                type: 'string',
                              },
                              oauth2: {
                                description: 'OAuth2 client credentials used to fetch a token for the targets.',
                                properties: {
                                  clientId: {
                                    description: "`clientId` specifies a key of a Secret or ConfigMap containing the\nOAuth2 client's ID.",
                                    properties: {
                                      configMap: {
                                        description: 'ConfigMap containing data to use for the targets.',
                                        properties: {
                                          key: {
                                            description: 'The key to select.',
                                            type: 'string',
                                          },
                                          name: {
                                            default: '',
                                            description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                            type: 'string',
                                          },
                                          optional: {
                                            description: 'Specify whether the ConfigMap or its key must be defined',
                                            type: 'boolean',
                                          },
                                        },
                                        required: [
                                          'key',
                                        ],
                                        type: 'object',
                                        'x-kubernetes-map-type': 'atomic',
                                      },
                                      secret: {
                                        description: 'Secret containing data to use for the targets.',
                                        properties: {
                                          key: {
                                            description: 'The key of the secret to select from.  Must be a valid secret key.',
                                            type: 'string',
                                          },
                                          name: {
                                            default: '',
                                            description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                            type: 'string',
                                          },
                                          optional: {
                                            description: 'Specify whether the Secret or its key must be defined',
                                            type: 'boolean',
                                          },
                                        },
                                        required: [
                                          'key',
                                        ],
                                        type: 'object',
                                        'x-kubernetes-map-type': 'atomic',
                                      },
                                    },
                                    type: 'object',
                                  },
                                  clientSecret: {
                                    description: "`clientSecret` specifies a key of a Secret containing the OAuth2\nclient's secret.",
                                    properties: {
                                      key: {
                                        description: 'The key of the secret to select from.  Must be a valid secret key.',
                                        type: 'string',
                                      },
                                      name: {
                                        default: '',
                                        description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                        type: 'string',
                                      },
                                      optional: {
                                        description: 'Specify whether the Secret or its key must be defined',
                                        type: 'boolean',
                                      },
                                    },
                                    required: [
                                      'key',
                                    ],
                                    type: 'object',
                                    'x-kubernetes-map-type': 'atomic',
                                  },
                                  endpointParams: {
                                    additionalProperties: {
                                      type: 'string',
                                    },
                                    description: '`endpointParams` configures the HTTP parameters to append to the token\nURL.',
                                    type: 'object',
                                  },
                                  noProxy: {
                                    description: '`noProxy` is a comma-separated string that can contain IPs, CIDR notation, domain names\nthat should be excluded from proxying. IP and domain names can\ncontain port numbers.\n\nIt requires Prometheus >= v2.43.0 or Alertmanager >= 0.25.0.',
                                    type: 'string',
                                  },
                                  proxyConnectHeader: {
                                    additionalProperties: {
                                      items: {
                                        description: 'SecretKeySelector selects a key of a Secret.',
                                        properties: {
                                          key: {
                                            description: 'The key of the secret to select from.  Must be a valid secret key.',
                                            type: 'string',
                                          },
                                          name: {
                                            default: '',
                                            description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                            type: 'string',
                                          },
                                          optional: {
                                            description: 'Specify whether the Secret or its key must be defined',
                                            type: 'boolean',
                                          },
                                        },
                                        required: [
                                          'key',
                                        ],
                                        type: 'object',
                                        'x-kubernetes-map-type': 'atomic',
                                      },
                                      type: 'array',
                                    },
                                    description: 'ProxyConnectHeader optionally specifies headers to send to\nproxies during CONNECT requests.\n\nIt requires Prometheus >= v2.43.0 or Alertmanager >= 0.25.0.',
                                    type: 'object',
                                    'x-kubernetes-map-type': 'atomic',
                                  },
                                  proxyFromEnvironment: {
                                    description: 'Whether to use the proxy configuration defined by environment variables (HTTP_PROXY, HTTPS_PROXY, and NO_PROXY).\n\nIt requires Prometheus >= v2.43.0 or Alertmanager >= 0.25.0.',
                                    type: 'boolean',
                                  },
                                  proxyUrl: {
                                    description: '`proxyURL` defines the HTTP proxy server to use.',
                                    pattern: '^http(s)?://.+$',
                                    type: 'string',
                                  },
                                  scopes: {
                                    description: '`scopes` defines the OAuth2 scopes used for the token request.',
                                    items: {
                                      type: 'string',
                                    },
                                    type: 'array',
                                  },
                                  tlsConfig: {
                                    description: 'TLS configuration to use when connecting to the OAuth2 server.\nIt requires Prometheus >= v2.43.0.',
                                    properties: {
                                      ca: {
                                        description: 'Certificate authority used when verifying server certificates.',
                                        properties: {
                                          configMap: {
                                            description: 'ConfigMap containing data to use for the targets.',
                                            properties: {
                                              key: {
                                                description: 'The key to select.',
                                                type: 'string',
                                              },
                                              name: {
                                                default: '',
                                                description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                                type: 'string',
                                              },
                                              optional: {
                                                description: 'Specify whether the ConfigMap or its key must be defined',
                                                type: 'boolean',
                                              },
                                            },
                                            required: [
                                              'key',
                                            ],
                                            type: 'object',
                                            'x-kubernetes-map-type': 'atomic',
                                          },
                                          secret: {
                                            description: 'Secret containing data to use for the targets.',
                                            properties: {
                                              key: {
                                                description: 'The key of the secret to select from.  Must be a valid secret key.',
                                                type: 'string',
                                              },
                                              name: {
                                                default: '',
                                                description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                                type: 'string',
                                              },
                                              optional: {
                                                description: 'Specify whether the Secret or its key must be defined',
                                                type: 'boolean',
                                              },
                                            },
                                            required: [
                                              'key',
                                            ],
                                            type: 'object',
                                            'x-kubernetes-map-type': 'atomic',
                                          },
                                        },
                                        type: 'object',
                                      },
                                      cert: {
                                        description: 'Client certificate to present when doing client-authentication.',
                                        properties: {
                                          configMap: {
                                            description: 'ConfigMap containing data to use for the targets.',
                                            properties: {
                                              key: {
                                                description: 'The key to select.',
                                                type: 'string',
                                              },
                                              name: {
                                                default: '',
                                                description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                                type: 'string',
                                              },
                                              optional: {
                                                description: 'Specify whether the ConfigMap or its key must be defined',
                                                type: 'boolean',
                                              },
                                            },
                                            required: [
                                              'key',
                                            ],
                                            type: 'object',
                                            'x-kubernetes-map-type': 'atomic',
                                          },
                                          secret: {
                                            description: 'Secret containing data to use for the targets.',
                                            properties: {
                                              key: {
                                                description: 'The key of the secret to select from.  Must be a valid secret key.',
                                                type: 'string',
                                              },
                                              name: {
                                                default: '',
                                                description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                                type: 'string',
                                              },
                                              optional: {
                                                description: 'Specify whether the Secret or its key must be defined',
                                                type: 'boolean',
                                              },
                                            },
                                            required: [
                                              'key',
                                            ],
                                            type: 'object',
                                            'x-kubernetes-map-type': 'atomic',
                                          },
                                        },
                                        type: 'object',
                                      },
                                      insecureSkipVerify: {
                                        description: 'Disable target certificate validation.',
                                        type: 'boolean',
                                      },
                                      keySecret: {
                                        description: 'Secret containing the client key file for the targets.',
                                        properties: {
                                          key: {
                                            description: 'The key of the secret to select from.  Must be a valid secret key.',
                                            type: 'string',
                                          },
                                          name: {
                                            default: '',
                                            description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                            type: 'string',
                                          },
                                          optional: {
                                            description: 'Specify whether the Secret or its key must be defined',
                                            type: 'boolean',
                                          },
                                        },
                                        required: [
                                          'key',
                                        ],
                                        type: 'object',
                                        'x-kubernetes-map-type': 'atomic',
                                      },
                                      maxVersion: {
                                        description: 'Maximum acceptable TLS version.\n\nIt requires Prometheus >= v2.41.0.',
                                        enum: [
                                          'TLS10',
                                          'TLS11',
                                          'TLS12',
                                          'TLS13',
                                        ],
                                        type: 'string',
                                      },
                                      minVersion: {
                                        description: 'Minimum acceptable TLS version.\n\nIt requires Prometheus >= v2.35.0.',
                                        enum: [
                                          'TLS10',
                                          'TLS11',
                                          'TLS12',
                                          'TLS13',
                                        ],
                                        type: 'string',
                                      },
                                      serverName: {
                                        description: 'Used to verify the hostname for the targets.',
                                        type: 'string',
                                      },
                                    },
                                    type: 'object',
                                  },
                                  tokenUrl: {
                                    description: '`tokenURL` configures the URL to fetch the token from.',
                                    minLength: 1,
                                    type: 'string',
                                  },
                                },
                                required: [
                                  'clientId',
                                  'clientSecret',
                                  'tokenUrl',
                                ],
                                type: 'object',
                              },
                              proxyConnectHeader: {
                                additionalProperties: {
                                  items: {
                                    description: 'SecretKeySelector selects a key of a Secret.',
                                    properties: {
                                      key: {
                                        description: 'The key of the secret to select from.  Must be a valid secret key.',
                                        type: 'string',
                                      },
                                      name: {
                                        default: '',
                                        description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                        type: 'string',
                                      },
                                      optional: {
                                        description: 'Specify whether the Secret or its key must be defined',
                                        type: 'boolean',
                                      },
                                    },
                                    required: [
                                      'key',
                                    ],
                                    type: 'object',
                                    'x-kubernetes-map-type': 'atomic',
                                  },
                                  type: 'array',
                                },
                                description: 'ProxyConnectHeader optionally specifies headers to send to\nproxies during CONNECT requests.\n\nIt requires Prometheus >= v2.43.0 or Alertmanager >= 0.25.0.',
                                type: 'object',
                                'x-kubernetes-map-type': 'atomic',
                              },
                              proxyFromEnvironment: {
                                description: 'Whether to use the proxy configuration defined by environment variables (HTTP_PROXY, HTTPS_PROXY, and NO_PROXY).\n\nIt requires Prometheus >= v2.43.0 or Alertmanager >= 0.25.0.',
                                type: 'boolean',
                              },
                              proxyURL: {
                                description: 'Optional proxy URL.\n\nIf defined, this field takes precedence over `proxyUrl`.',
                                type: 'string',
                              },
                              proxyUrl: {
                                description: '`proxyURL` defines the HTTP proxy server to use.',
                                pattern: '^http(s)?://.+$',
                                type: 'string',
                              },
                              tlsConfig: {
                                description: 'TLS configuration for the client.',
                                properties: {
                                  ca: {
                                    description: 'Certificate authority used when verifying server certificates.',
                                    properties: {
                                      configMap: {
                                        description: 'ConfigMap containing data to use for the targets.',
                                        properties: {
                                          key: {
                                            description: 'The key to select.',
                                            type: 'string',
                                          },
                                          name: {
                                            default: '',
                                            description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                            type: 'string',
                                          },
                                          optional: {
                                            description: 'Specify whether the ConfigMap or its key must be defined',
                                            type: 'boolean',
                                          },
                                        },
                                        required: [
                                          'key',
                                        ],
                                        type: 'object',
                                        'x-kubernetes-map-type': 'atomic',
                                      },
                                      secret: {
                                        description: 'Secret containing data to use for the targets.',
                                        properties: {
                                          key: {
                                            description: 'The key of the secret to select from.  Must be a valid secret key.',
                                            type: 'string',
                                          },
                                          name: {
                                            default: '',
                                            description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                            type: 'string',
                                          },
                                          optional: {
                                            description: 'Specify whether the Secret or its key must be defined',
                                            type: 'boolean',
                                          },
                                        },
                                        required: [
                                          'key',
                                        ],
                                        type: 'object',
                                        'x-kubernetes-map-type': 'atomic',
                                      },
                                    },
                                    type: 'object',
                                  },
                                  cert: {
                                    description: 'Client certificate to present when doing client-authentication.',
                                    properties: {
                                      configMap: {
                                        description: 'ConfigMap containing data to use for the targets.',
                                        properties: {
                                          key: {
                                            description: 'The key to select.',
                                            type: 'string',
                                          },
                                          name: {
                                            default: '',
                                            description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                            type: 'string',
                                          },
                                          optional: {
                                            description: 'Specify whether the ConfigMap or its key must be defined',
                                            type: 'boolean',
                                          },
                                        },
                                        required: [
                                          'key',
                                        ],
                                        type: 'object',
                                        'x-kubernetes-map-type': 'atomic',
                                      },
                                      secret: {
                                        description: 'Secret containing data to use for the targets.',
                                        properties: {
                                          key: {
                                            description: 'The key of the secret to select from.  Must be a valid secret key.',
                                            type: 'string',
                                          },
                                          name: {
                                            default: '',
                                            description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                            type: 'string',
                                          },
                                          optional: {
                                            description: 'Specify whether the Secret or its key must be defined',
                                            type: 'boolean',
                                          },
                                        },
                                        required: [
                                          'key',
                                        ],
                                        type: 'object',
                                        'x-kubernetes-map-type': 'atomic',
                                      },
                                    },
                                    type: 'object',
                                  },
                                  insecureSkipVerify: {
                                    description: 'Disable target certificate validation.',
                                    type: 'boolean',
                                  },
                                  keySecret: {
                                    description: 'Secret containing the client key file for the targets.',
                                    properties: {
                                      key: {
                                        description: 'The key of the secret to select from.  Must be a valid secret key.',
                                        type: 'string',
                                      },
                                      name: {
                                        default: '',
                                        description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                        type: 'string',
                                      },
                                      optional: {
                                        description: 'Specify whether the Secret or its key must be defined',
                                        type: 'boolean',
                                      },
                                    },
                                    required: [
                                      'key',
                                    ],
                                    type: 'object',
                                    'x-kubernetes-map-type': 'atomic',
                                  },
                                  maxVersion: {
                                    description: 'Maximum acceptable TLS version.\n\nIt requires Prometheus >= v2.41.0.',
                                    enum: [
                                      'TLS10',
                                      'TLS11',
                                      'TLS12',
                                      'TLS13',
                                    ],
                                    type: 'string',
                                  },
                                  minVersion: {
                                    description: 'Minimum acceptable TLS version.\n\nIt requires Prometheus >= v2.35.0.',
                                    enum: [
                                      'TLS10',
                                      'TLS11',
                                      'TLS12',
                                      'TLS13',
                                    ],
                                    type: 'string',
                                  },
                                  serverName: {
                                    description: 'Used to verify the hostname for the targets.',
                                    type: 'string',
                                  },
                                },
                                type: 'object',
                              },
                            },
                            type: 'object',
                          },
                          message: {
                            description: 'Message template',
                            type: 'string',
                          },
                          roomID: {
                            description: 'ID of the Webex Teams room where to send the messages.',
                            minLength: 1,
                            type: 'string',
                          },
                          sendResolved: {
                            description: 'Whether to notify about resolved alerts.',
                            type: 'boolean',
                          },
                        },
                        required: [
                          'roomID',
                        ],
                        type: 'object',
                      },
                      type: 'array',
                    },
                    webhookConfigs: {
                      description: 'List of webhook configurations.',
                      items: {
                        description: 'WebhookConfig configures notifications via a generic receiver supporting the webhook payload.\nSee https://prometheus.io/docs/alerting/latest/configuration/#webhook_config',
                        properties: {
                          httpConfig: {
                            description: 'HTTP client configuration.',
                            properties: {
                              authorization: {
                                description: 'Authorization header configuration for the client.\nThis is mutually exclusive with BasicAuth and is only available starting from Alertmanager v0.22+.',
                                properties: {
                                  credentials: {
                                    description: 'Selects a key of a Secret in the namespace that contains the credentials for authentication.',
                                    properties: {
                                      key: {
                                        description: 'The key of the secret to select from.  Must be a valid secret key.',
                                        type: 'string',
                                      },
                                      name: {
                                        default: '',
                                        description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                        type: 'string',
                                      },
                                      optional: {
                                        description: 'Specify whether the Secret or its key must be defined',
                                        type: 'boolean',
                                      },
                                    },
                                    required: [
                                      'key',
                                    ],
                                    type: 'object',
                                    'x-kubernetes-map-type': 'atomic',
                                  },
                                  type: {
                                    description: 'Defines the authentication type. The value is case-insensitive.\n\n"Basic" is not a supported value.\n\nDefault: "Bearer"',
                                    type: 'string',
                                  },
                                },
                                type: 'object',
                              },
                              basicAuth: {
                                description: 'BasicAuth for the client.\nThis is mutually exclusive with Authorization. If both are defined, BasicAuth takes precedence.',
                                properties: {
                                  password: {
                                    description: '`password` specifies a key of a Secret containing the password for\nauthentication.',
                                    properties: {
                                      key: {
                                        description: 'The key of the secret to select from.  Must be a valid secret key.',
                                        type: 'string',
                                      },
                                      name: {
                                        default: '',
                                        description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                        type: 'string',
                                      },
                                      optional: {
                                        description: 'Specify whether the Secret or its key must be defined',
                                        type: 'boolean',
                                      },
                                    },
                                    required: [
                                      'key',
                                    ],
                                    type: 'object',
                                    'x-kubernetes-map-type': 'atomic',
                                  },
                                  username: {
                                    description: '`username` specifies a key of a Secret containing the username for\nauthentication.',
                                    properties: {
                                      key: {
                                        description: 'The key of the secret to select from.  Must be a valid secret key.',
                                        type: 'string',
                                      },
                                      name: {
                                        default: '',
                                        description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                        type: 'string',
                                      },
                                      optional: {
                                        description: 'Specify whether the Secret or its key must be defined',
                                        type: 'boolean',
                                      },
                                    },
                                    required: [
                                      'key',
                                    ],
                                    type: 'object',
                                    'x-kubernetes-map-type': 'atomic',
                                  },
                                },
                                type: 'object',
                              },
                              bearerTokenSecret: {
                                description: "The secret's key that contains the bearer token to be used by the client\nfor authentication.\nThe secret needs to be in the same namespace as the AlertmanagerConfig\nobject and accessible by the Prometheus Operator.",
                                properties: {
                                  key: {
                                    description: 'The key of the secret to select from.  Must be a valid secret key.',
                                    minLength: 1,
                                    type: 'string',
                                  },
                                  name: {
                                    description: "The name of the secret in the object's namespace to select from.",
                                    minLength: 1,
                                    type: 'string',
                                  },
                                },
                                required: [
                                  'key',
                                  'name',
                                ],
                                type: 'object',
                              },
                              followRedirects: {
                                description: 'FollowRedirects specifies whether the client should follow HTTP 3xx redirects.',
                                type: 'boolean',
                              },
                              noProxy: {
                                description: '`noProxy` is a comma-separated string that can contain IPs, CIDR notation, domain names\nthat should be excluded from proxying. IP and domain names can\ncontain port numbers.\n\nIt requires Prometheus >= v2.43.0 or Alertmanager >= 0.25.0.',
                                type: 'string',
                              },
                              oauth2: {
                                description: 'OAuth2 client credentials used to fetch a token for the targets.',
                                properties: {
                                  clientId: {
                                    description: "`clientId` specifies a key of a Secret or ConfigMap containing the\nOAuth2 client's ID.",
                                    properties: {
                                      configMap: {
                                        description: 'ConfigMap containing data to use for the targets.',
                                        properties: {
                                          key: {
                                            description: 'The key to select.',
                                            type: 'string',
                                          },
                                          name: {
                                            default: '',
                                            description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                            type: 'string',
                                          },
                                          optional: {
                                            description: 'Specify whether the ConfigMap or its key must be defined',
                                            type: 'boolean',
                                          },
                                        },
                                        required: [
                                          'key',
                                        ],
                                        type: 'object',
                                        'x-kubernetes-map-type': 'atomic',
                                      },
                                      secret: {
                                        description: 'Secret containing data to use for the targets.',
                                        properties: {
                                          key: {
                                            description: 'The key of the secret to select from.  Must be a valid secret key.',
                                            type: 'string',
                                          },
                                          name: {
                                            default: '',
                                            description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                            type: 'string',
                                          },
                                          optional: {
                                            description: 'Specify whether the Secret or its key must be defined',
                                            type: 'boolean',
                                          },
                                        },
                                        required: [
                                          'key',
                                        ],
                                        type: 'object',
                                        'x-kubernetes-map-type': 'atomic',
                                      },
                                    },
                                    type: 'object',
                                  },
                                  clientSecret: {
                                    description: "`clientSecret` specifies a key of a Secret containing the OAuth2\nclient's secret.",
                                    properties: {
                                      key: {
                                        description: 'The key of the secret to select from.  Must be a valid secret key.',
                                        type: 'string',
                                      },
                                      name: {
                                        default: '',
                                        description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                        type: 'string',
                                      },
                                      optional: {
                                        description: 'Specify whether the Secret or its key must be defined',
                                        type: 'boolean',
                                      },
                                    },
                                    required: [
                                      'key',
                                    ],
                                    type: 'object',
                                    'x-kubernetes-map-type': 'atomic',
                                  },
                                  endpointParams: {
                                    additionalProperties: {
                                      type: 'string',
                                    },
                                    description: '`endpointParams` configures the HTTP parameters to append to the token\nURL.',
                                    type: 'object',
                                  },
                                  noProxy: {
                                    description: '`noProxy` is a comma-separated string that can contain IPs, CIDR notation, domain names\nthat should be excluded from proxying. IP and domain names can\ncontain port numbers.\n\nIt requires Prometheus >= v2.43.0 or Alertmanager >= 0.25.0.',
                                    type: 'string',
                                  },
                                  proxyConnectHeader: {
                                    additionalProperties: {
                                      items: {
                                        description: 'SecretKeySelector selects a key of a Secret.',
                                        properties: {
                                          key: {
                                            description: 'The key of the secret to select from.  Must be a valid secret key.',
                                            type: 'string',
                                          },
                                          name: {
                                            default: '',
                                            description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                            type: 'string',
                                          },
                                          optional: {
                                            description: 'Specify whether the Secret or its key must be defined',
                                            type: 'boolean',
                                          },
                                        },
                                        required: [
                                          'key',
                                        ],
                                        type: 'object',
                                        'x-kubernetes-map-type': 'atomic',
                                      },
                                      type: 'array',
                                    },
                                    description: 'ProxyConnectHeader optionally specifies headers to send to\nproxies during CONNECT requests.\n\nIt requires Prometheus >= v2.43.0 or Alertmanager >= 0.25.0.',
                                    type: 'object',
                                    'x-kubernetes-map-type': 'atomic',
                                  },
                                  proxyFromEnvironment: {
                                    description: 'Whether to use the proxy configuration defined by environment variables (HTTP_PROXY, HTTPS_PROXY, and NO_PROXY).\n\nIt requires Prometheus >= v2.43.0 or Alertmanager >= 0.25.0.',
                                    type: 'boolean',
                                  },
                                  proxyUrl: {
                                    description: '`proxyURL` defines the HTTP proxy server to use.',
                                    pattern: '^http(s)?://.+$',
                                    type: 'string',
                                  },
                                  scopes: {
                                    description: '`scopes` defines the OAuth2 scopes used for the token request.',
                                    items: {
                                      type: 'string',
                                    },
                                    type: 'array',
                                  },
                                  tlsConfig: {
                                    description: 'TLS configuration to use when connecting to the OAuth2 server.\nIt requires Prometheus >= v2.43.0.',
                                    properties: {
                                      ca: {
                                        description: 'Certificate authority used when verifying server certificates.',
                                        properties: {
                                          configMap: {
                                            description: 'ConfigMap containing data to use for the targets.',
                                            properties: {
                                              key: {
                                                description: 'The key to select.',
                                                type: 'string',
                                              },
                                              name: {
                                                default: '',
                                                description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                                type: 'string',
                                              },
                                              optional: {
                                                description: 'Specify whether the ConfigMap or its key must be defined',
                                                type: 'boolean',
                                              },
                                            },
                                            required: [
                                              'key',
                                            ],
                                            type: 'object',
                                            'x-kubernetes-map-type': 'atomic',
                                          },
                                          secret: {
                                            description: 'Secret containing data to use for the targets.',
                                            properties: {
                                              key: {
                                                description: 'The key of the secret to select from.  Must be a valid secret key.',
                                                type: 'string',
                                              },
                                              name: {
                                                default: '',
                                                description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                                type: 'string',
                                              },
                                              optional: {
                                                description: 'Specify whether the Secret or its key must be defined',
                                                type: 'boolean',
                                              },
                                            },
                                            required: [
                                              'key',
                                            ],
                                            type: 'object',
                                            'x-kubernetes-map-type': 'atomic',
                                          },
                                        },
                                        type: 'object',
                                      },
                                      cert: {
                                        description: 'Client certificate to present when doing client-authentication.',
                                        properties: {
                                          configMap: {
                                            description: 'ConfigMap containing data to use for the targets.',
                                            properties: {
                                              key: {
                                                description: 'The key to select.',
                                                type: 'string',
                                              },
                                              name: {
                                                default: '',
                                                description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                                type: 'string',
                                              },
                                              optional: {
                                                description: 'Specify whether the ConfigMap or its key must be defined',
                                                type: 'boolean',
                                              },
                                            },
                                            required: [
                                              'key',
                                            ],
                                            type: 'object',
                                            'x-kubernetes-map-type': 'atomic',
                                          },
                                          secret: {
                                            description: 'Secret containing data to use for the targets.',
                                            properties: {
                                              key: {
                                                description: 'The key of the secret to select from.  Must be a valid secret key.',
                                                type: 'string',
                                              },
                                              name: {
                                                default: '',
                                                description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                                type: 'string',
                                              },
                                              optional: {
                                                description: 'Specify whether the Secret or its key must be defined',
                                                type: 'boolean',
                                              },
                                            },
                                            required: [
                                              'key',
                                            ],
                                            type: 'object',
                                            'x-kubernetes-map-type': 'atomic',
                                          },
                                        },
                                        type: 'object',
                                      },
                                      insecureSkipVerify: {
                                        description: 'Disable target certificate validation.',
                                        type: 'boolean',
                                      },
                                      keySecret: {
                                        description: 'Secret containing the client key file for the targets.',
                                        properties: {
                                          key: {
                                            description: 'The key of the secret to select from.  Must be a valid secret key.',
                                            type: 'string',
                                          },
                                          name: {
                                            default: '',
                                            description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                            type: 'string',
                                          },
                                          optional: {
                                            description: 'Specify whether the Secret or its key must be defined',
                                            type: 'boolean',
                                          },
                                        },
                                        required: [
                                          'key',
                                        ],
                                        type: 'object',
                                        'x-kubernetes-map-type': 'atomic',
                                      },
                                      maxVersion: {
                                        description: 'Maximum acceptable TLS version.\n\nIt requires Prometheus >= v2.41.0.',
                                        enum: [
                                          'TLS10',
                                          'TLS11',
                                          'TLS12',
                                          'TLS13',
                                        ],
                                        type: 'string',
                                      },
                                      minVersion: {
                                        description: 'Minimum acceptable TLS version.\n\nIt requires Prometheus >= v2.35.0.',
                                        enum: [
                                          'TLS10',
                                          'TLS11',
                                          'TLS12',
                                          'TLS13',
                                        ],
                                        type: 'string',
                                      },
                                      serverName: {
                                        description: 'Used to verify the hostname for the targets.',
                                        type: 'string',
                                      },
                                    },
                                    type: 'object',
                                  },
                                  tokenUrl: {
                                    description: '`tokenURL` configures the URL to fetch the token from.',
                                    minLength: 1,
                                    type: 'string',
                                  },
                                },
                                required: [
                                  'clientId',
                                  'clientSecret',
                                  'tokenUrl',
                                ],
                                type: 'object',
                              },
                              proxyConnectHeader: {
                                additionalProperties: {
                                  items: {
                                    description: 'SecretKeySelector selects a key of a Secret.',
                                    properties: {
                                      key: {
                                        description: 'The key of the secret to select from.  Must be a valid secret key.',
                                        type: 'string',
                                      },
                                      name: {
                                        default: '',
                                        description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                        type: 'string',
                                      },
                                      optional: {
                                        description: 'Specify whether the Secret or its key must be defined',
                                        type: 'boolean',
                                      },
                                    },
                                    required: [
                                      'key',
                                    ],
                                    type: 'object',
                                    'x-kubernetes-map-type': 'atomic',
                                  },
                                  type: 'array',
                                },
                                description: 'ProxyConnectHeader optionally specifies headers to send to\nproxies during CONNECT requests.\n\nIt requires Prometheus >= v2.43.0 or Alertmanager >= 0.25.0.',
                                type: 'object',
                                'x-kubernetes-map-type': 'atomic',
                              },
                              proxyFromEnvironment: {
                                description: 'Whether to use the proxy configuration defined by environment variables (HTTP_PROXY, HTTPS_PROXY, and NO_PROXY).\n\nIt requires Prometheus >= v2.43.0 or Alertmanager >= 0.25.0.',
                                type: 'boolean',
                              },
                              proxyURL: {
                                description: 'Optional proxy URL.\n\nIf defined, this field takes precedence over `proxyUrl`.',
                                type: 'string',
                              },
                              proxyUrl: {
                                description: '`proxyURL` defines the HTTP proxy server to use.',
                                pattern: '^http(s)?://.+$',
                                type: 'string',
                              },
                              tlsConfig: {
                                description: 'TLS configuration for the client.',
                                properties: {
                                  ca: {
                                    description: 'Certificate authority used when verifying server certificates.',
                                    properties: {
                                      configMap: {
                                        description: 'ConfigMap containing data to use for the targets.',
                                        properties: {
                                          key: {
                                            description: 'The key to select.',
                                            type: 'string',
                                          },
                                          name: {
                                            default: '',
                                            description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                            type: 'string',
                                          },
                                          optional: {
                                            description: 'Specify whether the ConfigMap or its key must be defined',
                                            type: 'boolean',
                                          },
                                        },
                                        required: [
                                          'key',
                                        ],
                                        type: 'object',
                                        'x-kubernetes-map-type': 'atomic',
                                      },
                                      secret: {
                                        description: 'Secret containing data to use for the targets.',
                                        properties: {
                                          key: {
                                            description: 'The key of the secret to select from.  Must be a valid secret key.',
                                            type: 'string',
                                          },
                                          name: {
                                            default: '',
                                            description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                            type: 'string',
                                          },
                                          optional: {
                                            description: 'Specify whether the Secret or its key must be defined',
                                            type: 'boolean',
                                          },
                                        },
                                        required: [
                                          'key',
                                        ],
                                        type: 'object',
                                        'x-kubernetes-map-type': 'atomic',
                                      },
                                    },
                                    type: 'object',
                                  },
                                  cert: {
                                    description: 'Client certificate to present when doing client-authentication.',
                                    properties: {
                                      configMap: {
                                        description: 'ConfigMap containing data to use for the targets.',
                                        properties: {
                                          key: {
                                            description: 'The key to select.',
                                            type: 'string',
                                          },
                                          name: {
                                            default: '',
                                            description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                            type: 'string',
                                          },
                                          optional: {
                                            description: 'Specify whether the ConfigMap or its key must be defined',
                                            type: 'boolean',
                                          },
                                        },
                                        required: [
                                          'key',
                                        ],
                                        type: 'object',
                                        'x-kubernetes-map-type': 'atomic',
                                      },
                                      secret: {
                                        description: 'Secret containing data to use for the targets.',
                                        properties: {
                                          key: {
                                            description: 'The key of the secret to select from.  Must be a valid secret key.',
                                            type: 'string',
                                          },
                                          name: {
                                            default: '',
                                            description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                            type: 'string',
                                          },
                                          optional: {
                                            description: 'Specify whether the Secret or its key must be defined',
                                            type: 'boolean',
                                          },
                                        },
                                        required: [
                                          'key',
                                        ],
                                        type: 'object',
                                        'x-kubernetes-map-type': 'atomic',
                                      },
                                    },
                                    type: 'object',
                                  },
                                  insecureSkipVerify: {
                                    description: 'Disable target certificate validation.',
                                    type: 'boolean',
                                  },
                                  keySecret: {
                                    description: 'Secret containing the client key file for the targets.',
                                    properties: {
                                      key: {
                                        description: 'The key of the secret to select from.  Must be a valid secret key.',
                                        type: 'string',
                                      },
                                      name: {
                                        default: '',
                                        description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                        type: 'string',
                                      },
                                      optional: {
                                        description: 'Specify whether the Secret or its key must be defined',
                                        type: 'boolean',
                                      },
                                    },
                                    required: [
                                      'key',
                                    ],
                                    type: 'object',
                                    'x-kubernetes-map-type': 'atomic',
                                  },
                                  maxVersion: {
                                    description: 'Maximum acceptable TLS version.\n\nIt requires Prometheus >= v2.41.0.',
                                    enum: [
                                      'TLS10',
                                      'TLS11',
                                      'TLS12',
                                      'TLS13',
                                    ],
                                    type: 'string',
                                  },
                                  minVersion: {
                                    description: 'Minimum acceptable TLS version.\n\nIt requires Prometheus >= v2.35.0.',
                                    enum: [
                                      'TLS10',
                                      'TLS11',
                                      'TLS12',
                                      'TLS13',
                                    ],
                                    type: 'string',
                                  },
                                  serverName: {
                                    description: 'Used to verify the hostname for the targets.',
                                    type: 'string',
                                  },
                                },
                                type: 'object',
                              },
                            },
                            type: 'object',
                          },
                          maxAlerts: {
                            description: 'Maximum number of alerts to be sent per webhook message. When 0, all alerts are included.',
                            format: 'int32',
                            minimum: 0,
                            type: 'integer',
                          },
                          sendResolved: {
                            description: 'Whether or not to notify about resolved alerts.',
                            type: 'boolean',
                          },
                          url: {
                            description: 'The URL to send HTTP POST requests to. `urlSecret` takes precedence over\n`url`. One of `urlSecret` and `url` should be defined.',
                            type: 'string',
                          },
                          urlSecret: {
                            description: "The secret's key that contains the webhook URL to send HTTP requests to.\n`urlSecret` takes precedence over `url`. One of `urlSecret` and `url`\nshould be defined.\nThe secret needs to be in the same namespace as the AlertmanagerConfig\nobject and accessible by the Prometheus Operator.",
                            properties: {
                              key: {
                                description: 'The key of the secret to select from.  Must be a valid secret key.',
                                minLength: 1,
                                type: 'string',
                              },
                              name: {
                                description: "The name of the secret in the object's namespace to select from.",
                                minLength: 1,
                                type: 'string',
                              },
                            },
                            required: [
                              'key',
                              'name',
                            ],
                            type: 'object',
                          },
                        },
                        type: 'object',
                      },
                      type: 'array',
                    },
                    wechatConfigs: {
                      description: 'List of WeChat configurations.',
                      items: {
                        description: 'WeChatConfig configures notifications via WeChat.\nSee https://prometheus.io/docs/alerting/latest/configuration/#wechat_config',
                        properties: {
                          agentID: {
                            type: 'string',
                          },
                          apiSecret: {
                            description: "The secret's key that contains the WeChat API key.\nThe secret needs to be in the same namespace as the AlertmanagerConfig\nobject and accessible by the Prometheus Operator.",
                            properties: {
                              key: {
                                description: 'The key of the secret to select from.  Must be a valid secret key.',
                                minLength: 1,
                                type: 'string',
                              },
                              name: {
                                description: "The name of the secret in the object's namespace to select from.",
                                minLength: 1,
                                type: 'string',
                              },
                            },
                            required: [
                              'key',
                              'name',
                            ],
                            type: 'object',
                          },
                          apiURL: {
                            description: 'The WeChat API URL.',
                            type: 'string',
                          },
                          corpID: {
                            description: 'The corp id for authentication.',
                            type: 'string',
                          },
                          httpConfig: {
                            description: 'HTTP client configuration.',
                            properties: {
                              authorization: {
                                description: 'Authorization header configuration for the client.\nThis is mutually exclusive with BasicAuth and is only available starting from Alertmanager v0.22+.',
                                properties: {
                                  credentials: {
                                    description: 'Selects a key of a Secret in the namespace that contains the credentials for authentication.',
                                    properties: {
                                      key: {
                                        description: 'The key of the secret to select from.  Must be a valid secret key.',
                                        type: 'string',
                                      },
                                      name: {
                                        default: '',
                                        description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                        type: 'string',
                                      },
                                      optional: {
                                        description: 'Specify whether the Secret or its key must be defined',
                                        type: 'boolean',
                                      },
                                    },
                                    required: [
                                      'key',
                                    ],
                                    type: 'object',
                                    'x-kubernetes-map-type': 'atomic',
                                  },
                                  type: {
                                    description: 'Defines the authentication type. The value is case-insensitive.\n\n"Basic" is not a supported value.\n\nDefault: "Bearer"',
                                    type: 'string',
                                  },
                                },
                                type: 'object',
                              },
                              basicAuth: {
                                description: 'BasicAuth for the client.\nThis is mutually exclusive with Authorization. If both are defined, BasicAuth takes precedence.',
                                properties: {
                                  password: {
                                    description: '`password` specifies a key of a Secret containing the password for\nauthentication.',
                                    properties: {
                                      key: {
                                        description: 'The key of the secret to select from.  Must be a valid secret key.',
                                        type: 'string',
                                      },
                                      name: {
                                        default: '',
                                        description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                        type: 'string',
                                      },
                                      optional: {
                                        description: 'Specify whether the Secret or its key must be defined',
                                        type: 'boolean',
                                      },
                                    },
                                    required: [
                                      'key',
                                    ],
                                    type: 'object',
                                    'x-kubernetes-map-type': 'atomic',
                                  },
                                  username: {
                                    description: '`username` specifies a key of a Secret containing the username for\nauthentication.',
                                    properties: {
                                      key: {
                                        description: 'The key of the secret to select from.  Must be a valid secret key.',
                                        type: 'string',
                                      },
                                      name: {
                                        default: '',
                                        description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                        type: 'string',
                                      },
                                      optional: {
                                        description: 'Specify whether the Secret or its key must be defined',
                                        type: 'boolean',
                                      },
                                    },
                                    required: [
                                      'key',
                                    ],
                                    type: 'object',
                                    'x-kubernetes-map-type': 'atomic',
                                  },
                                },
                                type: 'object',
                              },
                              bearerTokenSecret: {
                                description: "The secret's key that contains the bearer token to be used by the client\nfor authentication.\nThe secret needs to be in the same namespace as the AlertmanagerConfig\nobject and accessible by the Prometheus Operator.",
                                properties: {
                                  key: {
                                    description: 'The key of the secret to select from.  Must be a valid secret key.',
                                    minLength: 1,
                                    type: 'string',
                                  },
                                  name: {
                                    description: "The name of the secret in the object's namespace to select from.",
                                    minLength: 1,
                                    type: 'string',
                                  },
                                },
                                required: [
                                  'key',
                                  'name',
                                ],
                                type: 'object',
                              },
                              followRedirects: {
                                description: 'FollowRedirects specifies whether the client should follow HTTP 3xx redirects.',
                                type: 'boolean',
                              },
                              noProxy: {
                                description: '`noProxy` is a comma-separated string that can contain IPs, CIDR notation, domain names\nthat should be excluded from proxying. IP and domain names can\ncontain port numbers.\n\nIt requires Prometheus >= v2.43.0 or Alertmanager >= 0.25.0.',
                                type: 'string',
                              },
                              oauth2: {
                                description: 'OAuth2 client credentials used to fetch a token for the targets.',
                                properties: {
                                  clientId: {
                                    description: "`clientId` specifies a key of a Secret or ConfigMap containing the\nOAuth2 client's ID.",
                                    properties: {
                                      configMap: {
                                        description: 'ConfigMap containing data to use for the targets.',
                                        properties: {
                                          key: {
                                            description: 'The key to select.',
                                            type: 'string',
                                          },
                                          name: {
                                            default: '',
                                            description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                            type: 'string',
                                          },
                                          optional: {
                                            description: 'Specify whether the ConfigMap or its key must be defined',
                                            type: 'boolean',
                                          },
                                        },
                                        required: [
                                          'key',
                                        ],
                                        type: 'object',
                                        'x-kubernetes-map-type': 'atomic',
                                      },
                                      secret: {
                                        description: 'Secret containing data to use for the targets.',
                                        properties: {
                                          key: {
                                            description: 'The key of the secret to select from.  Must be a valid secret key.',
                                            type: 'string',
                                          },
                                          name: {
                                            default: '',
                                            description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                            type: 'string',
                                          },
                                          optional: {
                                            description: 'Specify whether the Secret or its key must be defined',
                                            type: 'boolean',
                                          },
                                        },
                                        required: [
                                          'key',
                                        ],
                                        type: 'object',
                                        'x-kubernetes-map-type': 'atomic',
                                      },
                                    },
                                    type: 'object',
                                  },
                                  clientSecret: {
                                    description: "`clientSecret` specifies a key of a Secret containing the OAuth2\nclient's secret.",
                                    properties: {
                                      key: {
                                        description: 'The key of the secret to select from.  Must be a valid secret key.',
                                        type: 'string',
                                      },
                                      name: {
                                        default: '',
                                        description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                        type: 'string',
                                      },
                                      optional: {
                                        description: 'Specify whether the Secret or its key must be defined',
                                        type: 'boolean',
                                      },
                                    },
                                    required: [
                                      'key',
                                    ],
                                    type: 'object',
                                    'x-kubernetes-map-type': 'atomic',
                                  },
                                  endpointParams: {
                                    additionalProperties: {
                                      type: 'string',
                                    },
                                    description: '`endpointParams` configures the HTTP parameters to append to the token\nURL.',
                                    type: 'object',
                                  },
                                  noProxy: {
                                    description: '`noProxy` is a comma-separated string that can contain IPs, CIDR notation, domain names\nthat should be excluded from proxying. IP and domain names can\ncontain port numbers.\n\nIt requires Prometheus >= v2.43.0 or Alertmanager >= 0.25.0.',
                                    type: 'string',
                                  },
                                  proxyConnectHeader: {
                                    additionalProperties: {
                                      items: {
                                        description: 'SecretKeySelector selects a key of a Secret.',
                                        properties: {
                                          key: {
                                            description: 'The key of the secret to select from.  Must be a valid secret key.',
                                            type: 'string',
                                          },
                                          name: {
                                            default: '',
                                            description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                            type: 'string',
                                          },
                                          optional: {
                                            description: 'Specify whether the Secret or its key must be defined',
                                            type: 'boolean',
                                          },
                                        },
                                        required: [
                                          'key',
                                        ],
                                        type: 'object',
                                        'x-kubernetes-map-type': 'atomic',
                                      },
                                      type: 'array',
                                    },
                                    description: 'ProxyConnectHeader optionally specifies headers to send to\nproxies during CONNECT requests.\n\nIt requires Prometheus >= v2.43.0 or Alertmanager >= 0.25.0.',
                                    type: 'object',
                                    'x-kubernetes-map-type': 'atomic',
                                  },
                                  proxyFromEnvironment: {
                                    description: 'Whether to use the proxy configuration defined by environment variables (HTTP_PROXY, HTTPS_PROXY, and NO_PROXY).\n\nIt requires Prometheus >= v2.43.0 or Alertmanager >= 0.25.0.',
                                    type: 'boolean',
                                  },
                                  proxyUrl: {
                                    description: '`proxyURL` defines the HTTP proxy server to use.',
                                    pattern: '^http(s)?://.+$',
                                    type: 'string',
                                  },
                                  scopes: {
                                    description: '`scopes` defines the OAuth2 scopes used for the token request.',
                                    items: {
                                      type: 'string',
                                    },
                                    type: 'array',
                                  },
                                  tlsConfig: {
                                    description: 'TLS configuration to use when connecting to the OAuth2 server.\nIt requires Prometheus >= v2.43.0.',
                                    properties: {
                                      ca: {
                                        description: 'Certificate authority used when verifying server certificates.',
                                        properties: {
                                          configMap: {
                                            description: 'ConfigMap containing data to use for the targets.',
                                            properties: {
                                              key: {
                                                description: 'The key to select.',
                                                type: 'string',
                                              },
                                              name: {
                                                default: '',
                                                description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                                type: 'string',
                                              },
                                              optional: {
                                                description: 'Specify whether the ConfigMap or its key must be defined',
                                                type: 'boolean',
                                              },
                                            },
                                            required: [
                                              'key',
                                            ],
                                            type: 'object',
                                            'x-kubernetes-map-type': 'atomic',
                                          },
                                          secret: {
                                            description: 'Secret containing data to use for the targets.',
                                            properties: {
                                              key: {
                                                description: 'The key of the secret to select from.  Must be a valid secret key.',
                                                type: 'string',
                                              },
                                              name: {
                                                default: '',
                                                description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                                type: 'string',
                                              },
                                              optional: {
                                                description: 'Specify whether the Secret or its key must be defined',
                                                type: 'boolean',
                                              },
                                            },
                                            required: [
                                              'key',
                                            ],
                                            type: 'object',
                                            'x-kubernetes-map-type': 'atomic',
                                          },
                                        },
                                        type: 'object',
                                      },
                                      cert: {
                                        description: 'Client certificate to present when doing client-authentication.',
                                        properties: {
                                          configMap: {
                                            description: 'ConfigMap containing data to use for the targets.',
                                            properties: {
                                              key: {
                                                description: 'The key to select.',
                                                type: 'string',
                                              },
                                              name: {
                                                default: '',
                                                description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                                type: 'string',
                                              },
                                              optional: {
                                                description: 'Specify whether the ConfigMap or its key must be defined',
                                                type: 'boolean',
                                              },
                                            },
                                            required: [
                                              'key',
                                            ],
                                            type: 'object',
                                            'x-kubernetes-map-type': 'atomic',
                                          },
                                          secret: {
                                            description: 'Secret containing data to use for the targets.',
                                            properties: {
                                              key: {
                                                description: 'The key of the secret to select from.  Must be a valid secret key.',
                                                type: 'string',
                                              },
                                              name: {
                                                default: '',
                                                description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                                type: 'string',
                                              },
                                              optional: {
                                                description: 'Specify whether the Secret or its key must be defined',
                                                type: 'boolean',
                                              },
                                            },
                                            required: [
                                              'key',
                                            ],
                                            type: 'object',
                                            'x-kubernetes-map-type': 'atomic',
                                          },
                                        },
                                        type: 'object',
                                      },
                                      insecureSkipVerify: {
                                        description: 'Disable target certificate validation.',
                                        type: 'boolean',
                                      },
                                      keySecret: {
                                        description: 'Secret containing the client key file for the targets.',
                                        properties: {
                                          key: {
                                            description: 'The key of the secret to select from.  Must be a valid secret key.',
                                            type: 'string',
                                          },
                                          name: {
                                            default: '',
                                            description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                            type: 'string',
                                          },
                                          optional: {
                                            description: 'Specify whether the Secret or its key must be defined',
                                            type: 'boolean',
                                          },
                                        },
                                        required: [
                                          'key',
                                        ],
                                        type: 'object',
                                        'x-kubernetes-map-type': 'atomic',
                                      },
                                      maxVersion: {
                                        description: 'Maximum acceptable TLS version.\n\nIt requires Prometheus >= v2.41.0.',
                                        enum: [
                                          'TLS10',
                                          'TLS11',
                                          'TLS12',
                                          'TLS13',
                                        ],
                                        type: 'string',
                                      },
                                      minVersion: {
                                        description: 'Minimum acceptable TLS version.\n\nIt requires Prometheus >= v2.35.0.',
                                        enum: [
                                          'TLS10',
                                          'TLS11',
                                          'TLS12',
                                          'TLS13',
                                        ],
                                        type: 'string',
                                      },
                                      serverName: {
                                        description: 'Used to verify the hostname for the targets.',
                                        type: 'string',
                                      },
                                    },
                                    type: 'object',
                                  },
                                  tokenUrl: {
                                    description: '`tokenURL` configures the URL to fetch the token from.',
                                    minLength: 1,
                                    type: 'string',
                                  },
                                },
                                required: [
                                  'clientId',
                                  'clientSecret',
                                  'tokenUrl',
                                ],
                                type: 'object',
                              },
                              proxyConnectHeader: {
                                additionalProperties: {
                                  items: {
                                    description: 'SecretKeySelector selects a key of a Secret.',
                                    properties: {
                                      key: {
                                        description: 'The key of the secret to select from.  Must be a valid secret key.',
                                        type: 'string',
                                      },
                                      name: {
                                        default: '',
                                        description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                        type: 'string',
                                      },
                                      optional: {
                                        description: 'Specify whether the Secret or its key must be defined',
                                        type: 'boolean',
                                      },
                                    },
                                    required: [
                                      'key',
                                    ],
                                    type: 'object',
                                    'x-kubernetes-map-type': 'atomic',
                                  },
                                  type: 'array',
                                },
                                description: 'ProxyConnectHeader optionally specifies headers to send to\nproxies during CONNECT requests.\n\nIt requires Prometheus >= v2.43.0 or Alertmanager >= 0.25.0.',
                                type: 'object',
                                'x-kubernetes-map-type': 'atomic',
                              },
                              proxyFromEnvironment: {
                                description: 'Whether to use the proxy configuration defined by environment variables (HTTP_PROXY, HTTPS_PROXY, and NO_PROXY).\n\nIt requires Prometheus >= v2.43.0 or Alertmanager >= 0.25.0.',
                                type: 'boolean',
                              },
                              proxyURL: {
                                description: 'Optional proxy URL.\n\nIf defined, this field takes precedence over `proxyUrl`.',
                                type: 'string',
                              },
                              proxyUrl: {
                                description: '`proxyURL` defines the HTTP proxy server to use.',
                                pattern: '^http(s)?://.+$',
                                type: 'string',
                              },
                              tlsConfig: {
                                description: 'TLS configuration for the client.',
                                properties: {
                                  ca: {
                                    description: 'Certificate authority used when verifying server certificates.',
                                    properties: {
                                      configMap: {
                                        description: 'ConfigMap containing data to use for the targets.',
                                        properties: {
                                          key: {
                                            description: 'The key to select.',
                                            type: 'string',
                                          },
                                          name: {
                                            default: '',
                                            description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                            type: 'string',
                                          },
                                          optional: {
                                            description: 'Specify whether the ConfigMap or its key must be defined',
                                            type: 'boolean',
                                          },
                                        },
                                        required: [
                                          'key',
                                        ],
                                        type: 'object',
                                        'x-kubernetes-map-type': 'atomic',
                                      },
                                      secret: {
                                        description: 'Secret containing data to use for the targets.',
                                        properties: {
                                          key: {
                                            description: 'The key of the secret to select from.  Must be a valid secret key.',
                                            type: 'string',
                                          },
                                          name: {
                                            default: '',
                                            description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                            type: 'string',
                                          },
                                          optional: {
                                            description: 'Specify whether the Secret or its key must be defined',
                                            type: 'boolean',
                                          },
                                        },
                                        required: [
                                          'key',
                                        ],
                                        type: 'object',
                                        'x-kubernetes-map-type': 'atomic',
                                      },
                                    },
                                    type: 'object',
                                  },
                                  cert: {
                                    description: 'Client certificate to present when doing client-authentication.',
                                    properties: {
                                      configMap: {
                                        description: 'ConfigMap containing data to use for the targets.',
                                        properties: {
                                          key: {
                                            description: 'The key to select.',
                                            type: 'string',
                                          },
                                          name: {
                                            default: '',
                                            description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                            type: 'string',
                                          },
                                          optional: {
                                            description: 'Specify whether the ConfigMap or its key must be defined',
                                            type: 'boolean',
                                          },
                                        },
                                        required: [
                                          'key',
                                        ],
                                        type: 'object',
                                        'x-kubernetes-map-type': 'atomic',
                                      },
                                      secret: {
                                        description: 'Secret containing data to use for the targets.',
                                        properties: {
                                          key: {
                                            description: 'The key of the secret to select from.  Must be a valid secret key.',
                                            type: 'string',
                                          },
                                          name: {
                                            default: '',
                                            description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                            type: 'string',
                                          },
                                          optional: {
                                            description: 'Specify whether the Secret or its key must be defined',
                                            type: 'boolean',
                                          },
                                        },
                                        required: [
                                          'key',
                                        ],
                                        type: 'object',
                                        'x-kubernetes-map-type': 'atomic',
                                      },
                                    },
                                    type: 'object',
                                  },
                                  insecureSkipVerify: {
                                    description: 'Disable target certificate validation.',
                                    type: 'boolean',
                                  },
                                  keySecret: {
                                    description: 'Secret containing the client key file for the targets.',
                                    properties: {
                                      key: {
                                        description: 'The key of the secret to select from.  Must be a valid secret key.',
                                        type: 'string',
                                      },
                                      name: {
                                        default: '',
                                        description: 'Name of the referent.\nThis field is effectively required, but due to backwards compatibility is\nallowed to be empty. Instances of this type with an empty value here are\nalmost certainly wrong.\nMore info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names',
                                        type: 'string',
                                      },
                                      optional: {
                                        description: 'Specify whether the Secret or its key must be defined',
                                        type: 'boolean',
                                      },
                                    },
                                    required: [
                                      'key',
                                    ],
                                    type: 'object',
                                    'x-kubernetes-map-type': 'atomic',
                                  },
                                  maxVersion: {
                                    description: 'Maximum acceptable TLS version.\n\nIt requires Prometheus >= v2.41.0.',
                                    enum: [
                                      'TLS10',
                                      'TLS11',
                                      'TLS12',
                                      'TLS13',
                                    ],
                                    type: 'string',
                                  },
                                  minVersion: {
                                    description: 'Minimum acceptable TLS version.\n\nIt requires Prometheus >= v2.35.0.',
                                    enum: [
                                      'TLS10',
                                      'TLS11',
                                      'TLS12',
                                      'TLS13',
                                    ],
                                    type: 'string',
                                  },
                                  serverName: {
                                    description: 'Used to verify the hostname for the targets.',
                                    type: 'string',
                                  },
                                },
                                type: 'object',
                              },
                            },
                            type: 'object',
                          },
                          message: {
                            description: 'API request data as defined by the WeChat API.',
                            type: 'string',
                          },
                          messageType: {
                            type: 'string',
                          },
                          sendResolved: {
                            description: 'Whether or not to notify about resolved alerts.',
                            type: 'boolean',
                          },
                          toParty: {
                            type: 'string',
                          },
                          toTag: {
                            type: 'string',
                          },
                          toUser: {
                            type: 'string',
                          },
                        },
                        type: 'object',
                      },
                      type: 'array',
                    },
                  },
                  required: [
                    'name',
                  ],
                  type: 'object',
                },
                type: 'array',
              },
              route: {
                description: "The Alertmanager route definition for alerts matching the resource's\nnamespace. If present, it will be added to the generated Alertmanager\nconfiguration as a first-level route.",
                properties: {
                  activeTimeIntervals: {
                    description: 'ActiveTimeIntervals is a list of TimeInterval names when this route should be active.',
                    items: {
                      type: 'string',
                    },
                    type: 'array',
                  },
                  continue: {
                    description: 'Boolean indicating whether an alert should continue matching subsequent\nsibling nodes. It will always be overridden to true for the first-level\nroute by the Prometheus operator.',
                    type: 'boolean',
                  },
                  groupBy: {
                    description: 'List of labels to group by.\nLabels must not be repeated (unique list).\nSpecial label "..." (aggregate by all possible labels), if provided, must be the only element in the list.',
                    items: {
                      type: 'string',
                    },
                    type: 'array',
                  },
                  groupInterval: {
                    description: 'How long to wait before sending an updated notification.\nMust match the regular expression`^(([0-9]+)y)?(([0-9]+)w)?(([0-9]+)d)?(([0-9]+)h)?(([0-9]+)m)?(([0-9]+)s)?(([0-9]+)ms)?$`\nExample: "5m"',
                    type: 'string',
                  },
                  groupWait: {
                    description: 'How long to wait before sending the initial notification.\nMust match the regular expression`^(([0-9]+)y)?(([0-9]+)w)?(([0-9]+)d)?(([0-9]+)h)?(([0-9]+)m)?(([0-9]+)s)?(([0-9]+)ms)?$`\nExample: "30s"',
                    type: 'string',
                  },
                  matchers: {
                    description: "List of matchers that the alert's labels should match. For the first\nlevel route, the operator removes any existing equality and regexp\nmatcher on the `namespace` label and adds a `namespace: <object\nnamespace>` matcher.",
                    items: {
                      description: "Matcher defines how to match on alert's labels.",
                      properties: {
                        matchType: {
                          description: 'Match operator, one of `=` (equal to), `!=` (not equal to), `=~` (regex\nmatch) or `!~` (not regex match).\nNegative operators (`!=` and `!~`) require Alertmanager >= v0.22.0.',
                          enum: [
                            '!=',
                            '=',
                            '=~',
                            '!~',
                          ],
                          type: 'string',
                        },
                        name: {
                          description: 'Label to match.',
                          minLength: 1,
                          type: 'string',
                        },
                        value: {
                          description: 'Label value to match.',
                          type: 'string',
                        },
                      },
                      required: [
                        'name',
                      ],
                      type: 'object',
                    },
                    type: 'array',
                  },
                  muteTimeIntervals: {
                    description: "Note: this comment applies to the field definition above but appears\nbelow otherwise it gets included in the generated manifest.\nCRD schema doesn't support self-referential types for now (see\nhttps://github.com/kubernetes/kubernetes/issues/62872). We have to use\nan alternative type to circumvent the limitation. The downside is that\nthe Kube API can't validate the data beyond the fact that it is a valid\nJSON representation.\nMuteTimeIntervals is a list of TimeInterval names that will mute this route when matched.",
                    items: {
                      type: 'string',
                    },
                    type: 'array',
                  },
                  receiver: {
                    description: 'Name of the receiver for this route. If not empty, it should be listed in\nthe `receivers` field.',
                    type: 'string',
                  },
                  repeatInterval: {
                    description: 'How long to wait before repeating the last notification.\nMust match the regular expression`^(([0-9]+)y)?(([0-9]+)w)?(([0-9]+)d)?(([0-9]+)h)?(([0-9]+)m)?(([0-9]+)s)?(([0-9]+)ms)?$`\nExample: "4h"',
                    type: 'string',
                  },
                  routes: {
                    description: 'Child routes.',
                    items: {
                      'x-kubernetes-preserve-unknown-fields': true,
                    },
                    type: 'array',
                  },
                },
                type: 'object',
              },
              timeIntervals: {
                description: 'List of TimeInterval specifying when the routes should be muted or active.',
                items: {
                  description: 'TimeInterval specifies the periods in time when notifications will be muted or active.',
                  properties: {
                    name: {
                      description: 'Name of the time interval.',
                      type: 'string',
                    },
                    timeIntervals: {
                      description: 'TimeIntervals is a list of TimePeriod.',
                      items: {
                        description: 'TimePeriod describes periods of time.',
                        properties: {
                          daysOfMonth: {
                            description: 'DaysOfMonth is a list of DayOfMonthRange',
                            items: {
                              description: 'DayOfMonthRange is an inclusive range of days of the month beginning at 1',
                              properties: {
                                end: {
                                  description: 'End of the inclusive range',
                                  maximum: 31,
                                  minimum: -31,
                                  type: 'integer',
                                },
                                start: {
                                  description: 'Start of the inclusive range',
                                  maximum: 31,
                                  minimum: -31,
                                  type: 'integer',
                                },
                              },
                              type: 'object',
                            },
                            type: 'array',
                          },
                          months: {
                            description: 'Months is a list of MonthRange',
                            items: {
                              description: "MonthRange is an inclusive range of months of the year beginning in January\nMonths can be specified by name (e.g 'January') by numerical month (e.g '1') or as an inclusive range (e.g 'January:March', '1:3', '1:March')",
                              pattern: '^((?i)january|february|march|april|may|june|july|august|september|october|november|december|1[0-2]|[1-9])(?:((:((?i)january|february|march|april|may|june|july|august|september|october|november|december|1[0-2]|[1-9]))$)|$)',
                              type: 'string',
                            },
                            type: 'array',
                          },
                          times: {
                            description: 'Times is a list of TimeRange',
                            items: {
                              description: 'TimeRange defines a start and end time in 24hr format',
                              properties: {
                                endTime: {
                                  description: 'EndTime is the end time in 24hr format.',
                                  pattern: '^((([01][0-9])|(2[0-3])):[0-5][0-9])$|(^24:00$)',
                                  type: 'string',
                                },
                                startTime: {
                                  description: 'StartTime is the start time in 24hr format.',
                                  pattern: '^((([01][0-9])|(2[0-3])):[0-5][0-9])$|(^24:00$)',
                                  type: 'string',
                                },
                              },
                              type: 'object',
                            },
                            type: 'array',
                          },
                          weekdays: {
                            description: 'Weekdays is a list of WeekdayRange',
                            items: {
                              description: "WeekdayRange is an inclusive range of days of the week beginning on Sunday\nDays can be specified by name (e.g 'Sunday') or as an inclusive range (e.g 'Monday:Friday')",
                              pattern: '^((?i)sun|mon|tues|wednes|thurs|fri|satur)day(?:((:(sun|mon|tues|wednes|thurs|fri|satur)day)$)|$)',
                              type: 'string',
                            },
                            type: 'array',
                          },
                          years: {
                            description: 'Years is a list of YearRange',
                            items: {
                              description: 'YearRange is an inclusive range of years',
                              pattern: '^2\\d{3}(?::2\\d{3}|$)',
                              type: 'string',
                            },
                            type: 'array',
                          },
                        },
                        type: 'object',
                      },
                      type: 'array',
                    },
                  },
                  required: [
                    'name',
                  ],
                  type: 'object',
                },
                type: 'array',
              },
            },
            type: 'object',
          },
        },
        required: [
          'spec',
        ],
        type: 'object',
      },
    },
    served: true,
    storage: false,
  },
] } }