import Component from "@glimmer/component";
import { tracked } from "@glimmer/tracking";
import { action } from "@ember/object";
import { service } from "@ember/service";
import { ajax } from "discourse/lib/ajax";
import getURL from "discourse/lib/get-url";
import DButton from "discourse/ui-kit/d-button";
import { i18n } from "discourse-i18n";
import { themePrefix } from "virtual:theme";
import { pickForDay, supportedKunos, today } from "../lib/kuno-banner";

const DISMISS_KEY = "kuno-banner-dismissed";

export default class KunoBanner extends Component {
  @service keyValueStore;

  @tracked topics = [];
  @tracked dismissed = null;

  day = today();

  constructor() {
    super(...arguments);
    this.dismissed = this.keyValueStore.get(DISMISS_KEY);
    this.loadTopics();
  }

  async loadTopics() {
    const tag = settings.kuno_tag?.trim();
    if (!tag) {
      return;
    }
    try {
      const result = await ajax(`/tag/${encodeURIComponent(tag)}.json`);
      // Sorted by id: the list comes bumped-first, which would reshuffle the pool
      // (and the day's pick) every time someone replies.
      this.topics = (result.topic_list?.topics || []).sort(
        (a, b) => a.id - b.id
      );
    } catch {
      // A missing tag 404s; the supported Kunos still rotate on their own.
    }
  }

  get item() {
    const topics = this.topics.map((topic) => ({
      key: `topic-${topic.id}`,
      title: topic.title,
      url: getURL(`/t/${topic.slug}/${topic.id}`),
    }));
    const kunos = supportedKunos(settings.supported_kunos).map((url) => ({
      key: url,
      url,
      external: true,
    }));
    const item = pickForDay([...topics, ...kunos], this.day);
    return item && this.dismissed !== this.dismissKey(item) ? item : null;
  }

  dismissKey(item) {
    return `${this.day}|${item.key}`;
  }

  @action
  dismiss() {
    this.dismissed = this.dismissKey(this.item);
    this.keyValueStore.set({ key: DISMISS_KEY, value: this.dismissed });
  }

  <template>
    {{#if this.item}}
      <div class="kuno-banner">
        <p class="kuno-banner__content">
          {{#if this.item.external}}
            <span class="kuno-banner__intro">
              {{i18n (themePrefix "kuno_banner.supporting")}}
            </span>
            <a
              class="kuno-banner__link"
              href={{this.item.url}}
              target="_blank"
              rel="noopener noreferrer"
            >{{this.item.url}}</a>
          {{else}}
            <a
              class="kuno-banner__link"
              href={{this.item.url}}
            >{{this.item.title}}</a>
          {{/if}}
        </p>
        <DButton
          class="btn-transparent kuno-banner__close"
          @icon="xmark"
          @action={{this.dismiss}}
          @title={{themePrefix "kuno_banner.dismiss"}}
        />
      </div>
    {{/if}}
  </template>
}
