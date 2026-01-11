/**
 * Learn with Jeremy: Stack Discovery Form Generator
 *
 * HOW TO USE:
 * 1. Go to https://script.google.com
 * 2. Create new project
 * 3. Paste this entire script
 * 4. Click Run > createStackDiscoveryForm
 * 5. Authorize when prompted
 * 6. Check your Google Drive for the new form
 */

function createStackDiscoveryForm() {
  // Create the form
  var form = FormApp.create('Learn with Jeremy: Pre-Session Stack Discovery');

  form.setDescription(
    'Help me prepare for our Claude Code session by telling me about your setup.\n' +
    'Takes 5 minutes. Your answers shape our time together.'
  );

  form.setCollectEmail(true);
  form.setAllowResponseEdits(true);
  form.setConfirmationMessage(
    "Thanks! I'll review your answers and send your personalized verification checklist within 24 hours."
  );

  // ═══════════════════════════════════════════════════════════════
  // SECTION 1: Basic Information
  // ═══════════════════════════════════════════════════════════════
  form.addSectionHeaderItem()
    .setTitle('Basic Information');

  form.addTextItem()
    .setTitle('Full Name')
    .setRequired(true);

  form.addTextItem()
    .setTitle('Preferred First Name')
    .setHelpText('How should I address you?')
    .setRequired(false);

  form.addMultipleChoiceItem()
    .setTitle('Computer Type')
    .setChoiceValues([
      'Mac (Intel)',
      'Mac (Apple Silicon / M1/M2/M3)',
      'Windows',
      'Linux'
    ])
    .setRequired(true);

  // ═══════════════════════════════════════════════════════════════
  // SECTION 2: Technical Comfort Level
  // ═══════════════════════════════════════════════════════════════
  form.addSectionHeaderItem()
    .setTitle('Technical Comfort Level');

  form.addMultipleChoiceItem()
    .setTitle('Terminal / Command Line Experience')
    .setChoiceValues([
      'Never used it',
      'Used a few times',
      'Comfortable with basics',
      'Power user'
    ])
    .setRequired(true);

  form.addCheckboxItem()
    .setTitle('AI Tools You\'ve Used')
    .setHelpText('Check all that apply')
    .setChoiceValues([
      'Claude (web - claude.ai)',
      'ChatGPT',
      'GitHub Copilot',
      'Cursor',
      'n8n',
      'Make (Integromat)',
      'Zapier',
      'None of these'
    ])
    .setRequired(false);

  // ═══════════════════════════════════════════════════════════════
  // SECTION 3: Your Tech Stack
  // ═══════════════════════════════════════════════════════════════
  form.addSectionHeaderItem()
    .setTitle('Your Tech Stack')
    .setHelpText('Check all that apply. This helps me customize your session.');

  form.addCheckboxItem()
    .setTitle('Databases & Backend')
    .setChoiceValues([
      'Supabase',
      'Firebase / Firestore',
      'Airtable',
      'PostgreSQL (other hosting)',
      'MongoDB',
      'None yet'
    ])
    .setRequired(false);

  form.addCheckboxItem()
    .setTitle('Code & Deployment')
    .setChoiceValues([
      'GitHub',
      'Bolt.new',
      'Vercel',
      'Netlify',
      'Railway',
      'Render',
      'None yet'
    ])
    .setRequired(false);

  form.addCheckboxItem()
    .setTitle('Automation & Workflows')
    .setChoiceValues([
      'n8n',
      'Zapier',
      'Make (Integromat)',
      'GitHub Actions',
      'None'
    ])
    .setRequired(false);

  form.addCheckboxItem()
    .setTitle('Analytics')
    .setChoiceValues([
      'Plausible',
      'Google Analytics',
      'PostHog',
      'Mixpanel',
      'None'
    ])
    .setRequired(false);

  // ═══════════════════════════════════════════════════════════════
  // SECTION 4: Credential Readiness
  // ═══════════════════════════════════════════════════════════════
  form.addSectionHeaderItem()
    .setTitle('Credential Readiness')
    .setHelpText('Quick check on what you have ready');

  form.addMultipleChoiceItem()
    .setTitle('Do you have a GitHub account?')
    .setChoiceValues([
      'Yes',
      'No',
      'Not sure'
    ])
    .setRequired(true);

  form.addMultipleChoiceItem()
    .setTitle('Do you have your Supabase project URL handy?')
    .setChoiceValues([
      'Yes',
      'No',
      'Not using Supabase'
    ])
    .setRequired(false);

  form.addMultipleChoiceItem()
    .setTitle('Have you created a GitHub Personal Access Token before?')
    .setChoiceValues([
      'Yes',
      'No',
      'Unsure what that is'
    ])
    .setRequired(false);

  form.addMultipleChoiceItem()
    .setTitle('Do you have admin access to install software on your computer?')
    .setChoiceValues([
      'Yes',
      'No',
      'Not sure'
    ])
    .setRequired(true);

  // ═══════════════════════════════════════════════════════════════
  // SECTION 5: Your Project
  // ═══════════════════════════════════════════════════════════════
  form.addSectionHeaderItem()
    .setTitle('Your Project');

  form.addParagraphTextItem()
    .setTitle('What project will you use Claude Code for first?')
    .setHelpText('Brief description is fine')
    .setRequired(true);

  form.addCheckboxItem()
    .setTitle('What do you most want Claude Code to help with?')
    .setChoiceValues([
      'Writing code',
      'Debugging / fixing issues',
      'Learning new technologies',
      'Documentation',
      'Data analysis',
      'General productivity'
    ])
    .setRequired(true);

  form.addParagraphTextItem()
    .setTitle('Biggest frustration with your current workflow?')
    .setHelpText('Optional but helpful')
    .setRequired(false);

  // ═══════════════════════════════════════════════════════════════
  // SECTION 6: Scheduling
  // ═══════════════════════════════════════════════════════════════
  form.addSectionHeaderItem()
    .setTitle('Scheduling');

  form.addMultipleChoiceItem()
    .setTitle('Your Timezone')
    .setChoiceValues([
      'US Pacific (PT)',
      'US Mountain (MT)',
      'US Central (CT)',
      'US Eastern (ET)',
      'UK (GMT/BST)',
      'Central Europe (CET)',
      'Other (specify in next question)'
    ])
    .setRequired(true);

  form.addCheckboxItem()
    .setTitle('Best times for our session')
    .setChoiceValues([
      'Morning (9am - 12pm)',
      'Afternoon (12pm - 5pm)',
      'Evening (5pm - 8pm)',
      'Weekends'
    ])
    .setRequired(true);

  form.addMultipleChoiceItem()
    .setTitle('Preferred session length')
    .setChoiceValues([
      '45 minutes',
      '60 minutes',
      '90 minutes'
    ])
    .setRequired(true);

  // ═══════════════════════════════════════════════════════════════
  // FINAL: Anything else
  // ═══════════════════════════════════════════════════════════════
  form.addParagraphTextItem()
    .setTitle('Anything else I should know?')
    .setRequired(false);

  // Log the form URL
  var formUrl = form.getPublishedUrl();
  var editUrl = form.getEditUrl();

  Logger.log('═══════════════════════════════════════════════════════════════');
  Logger.log('FORM CREATED SUCCESSFULLY!');
  Logger.log('═══════════════════════════════════════════════════════════════');
  Logger.log('');
  Logger.log('Share this link with clients:');
  Logger.log(formUrl);
  Logger.log('');
  Logger.log('Edit the form here:');
  Logger.log(editUrl);
  Logger.log('');
  Logger.log('═══════════════════════════════════════════════════════════════');

  // Also show in UI
  var ui = SpreadsheetApp.getUi ? SpreadsheetApp.getUi() : null;
  if (FormApp.getUi) {
    FormApp.getUi().alert(
      'Form Created!\n\n' +
      'Public URL:\n' + formUrl + '\n\n' +
      'Check the Logs (View > Logs) for the full URLs.'
    );
  }

  return {
    publicUrl: formUrl,
    editUrl: editUrl
  };
}
