<?php

namespace Spatie\Newsletter;

class NewsletterList
{
    /** @var string */
    public $name;

    /** @var array */
    public $properties = [];


    public function __construct(string $name, array $properties)
    {
        $this->name = $name;
        $this->properties = $properties;
    }

    public function getId(): string
    {
        if (isset($this->properties['id'])) {
            return (string) $this->properties['id'];
        } else {
            throw new \RuntimeException("ID not found for newsletter list '{$this->name}'");
        }
    }


    public function getName(): string
    {
        return $this->name;
    }
}
