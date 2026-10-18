import Component from "@glimmer/component";
import { service } from "@ember/service";
import { apiInitializer } from "discourse/lib/api";
import { defaultHomepage } from "discourse/lib/utilities";
import KunoBanner from "../components/kuno-banner";

// discovery-above sits in Horizon's main column, below the welcome banner and above
// the navigation and topic list, so the card lines up with the sidebar grid.
// Same homepage test as core's welcome banner; the banner only mounts (and fetches)
// there.
class KunoBannerOutlet extends Component {
  @service router;

  get isHomepage() {
    return this.router.currentRouteName === `discovery.${defaultHomepage()}`;
  }

  <template>
    {{#if this.isHomepage}}
      <KunoBanner />
    {{/if}}
  </template>
}

export default apiInitializer((api) => {
  api.renderInOutlet("discovery-above", KunoBannerOutlet);
});
