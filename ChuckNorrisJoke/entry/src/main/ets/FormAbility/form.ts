import { FetchJokeLight} from '../api/FetchJoke';
import formBindingData from '@ohos.application.formBindingData';
import formInfo from '@ohos.application.formInfo';
import formProvider from '@ohos.application.formProvider';

export default {
    onCreate(want) {
        // Called to return a FormBindingData object.
        return formBindingData.createFormBindingData({ });
    },

    onCastToNormal(formId) {
        // Called when the form provider is notified that a temporary form is successfully
        // converted to a normal form.
        FetchJokeLight((joke) => {
            let formData = {
                "joke_color": 'black',
                "joke_text": joke.value
            };
            formProvider.updateForm(formId, formBindingData.createFormBindingData(formData))
        })
    },

    onUpdate(formId) {
        // Called to notify the form provider to update a specified form.
        FetchJokeLight((joke) => {
            let formData = {
                "joke_color": 'black',
                "joke_text": joke.value
            };
            formProvider.updateForm(formId, formBindingData.createFormBindingData(formData))
        })
    },

    onVisibilityChange(newStatus) {
        // Called when the form provider receives form events from the system.
    },

    onEvent(formId, message) {
        // Called when a specified message event defined by the form provider is triggered.
    },

    onDestroy(formId) {
        // Called to notify the form provider that a specified form has been destroyed.
    },

    onAcquireFormState(want) {
        // Called to return a {@link FormState} object.
        return formInfo.FormState.READY;
    },
};