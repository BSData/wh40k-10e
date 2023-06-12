<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<gameSystem id="sys-352e-adc2-7639-d6a9" name="Warhammer 40,000 10th Edition" revision="1" battleScribeVersion="2.03" xmlns="http://www.battlescribe.net/schema/gameSystemSchema">
  <costTypes>
    <costType id="51b2-306e-1021-d207" name="pts" hidden="false"/>
    <costType id="c5fb-5b9b-89f6-86c" name="pl" hidden="false"/>
  </costTypes>
  <profileTypes>
    <profileType id="c547-1836-d8a-ff4f" name="Unit">
      <characteristicTypes>
        <characteristicType id="e703-ecb6-5ce7-aec1" name="M"/>
        <characteristicType id="d29d-cf75-fc2d-34a4" name="T"/>
        <characteristicType id="450-a17e-9d5e-29da" name="SV"/>
        <characteristicType id="750a-a2ec-90d3-21fe" name="W"/>
        <characteristicType id="58d2-b879-49c7-43bc" name="LD"/>
        <characteristicType id="bef7-942a-1a23-59f8" name="OC"/>
      </characteristicTypes>
    </profileType>
    <profileType id="f77d-b953-8fa4-b762" name="Ranged Weapon">
      <characteristicTypes>
        <characteristicType id="9896-9419-16a1-92fc" name="Range"/>
        <characteristicType id="3bb-c35f-f54-fb08" name="A"/>
        <characteristicType id="94d-8a98-cf90-183e" name="BS"/>
        <characteristicType id="2229-f494-25db-c5d3" name="S"/>
        <characteristicType id="9ead-8a10-520-de15" name="AP"/>
        <characteristicType id="a354-c1c8-a745-f9e3" name="D"/>
      </characteristicTypes>
    </profileType>
    <profileType id="9cc3-6d83-4dd3-9b64" name="Abilities">
      <characteristicTypes>
        <characteristicType id="9b8f-694b-e5e-b573" name="Description"/>
      </characteristicTypes>
    </profileType>
    <profileType id="8a40-4aaa-c780-9046" name="Melee Weapon">
      <characteristicTypes>
        <characteristicType id="914c-b413-91e3-a132" name="Range"/>
        <characteristicType id="2337-daa1-6682-b110" name="A"/>
        <characteristicType id="95d1-95f-45b4-11d6" name="WS"/>
        <characteristicType id="ab33-d393-96ce-ccba" name="S"/>
        <characteristicType id="41a0-1301-112a-e2f2" name="AP"/>
        <characteristicType id="3254-9fe6-d824-513e" name="D"/>
      </characteristicTypes>
    </profileType>
  </profileTypes>
  <categoryEntries>
    <categoryEntry id="9cfd-1c32-585f-7d5c" name="Character" hidden="false"/>
    <categoryEntry id="4f3a-f0f7-6647-348d" name="Epic Hero" hidden="false"/>
    <categoryEntry id="cf47-a0d7-7207-29dc" name="Infantry" hidden="false"/>
    <categoryEntry id="9693-cf84-fe69-37a9" name="Monster" hidden="false"/>
    <categoryEntry id="e338-111e-d0c6-b687" name="Battleline" hidden="false"/>
    <categoryEntry id="ba07-411c-2832-1f79" name="Dedicated Transport" hidden="false"/>
    <categoryEntry id="14a0-40c9-2748-ae6e" name="Mounted" hidden="false"/>
    <categoryEntry name="Captain" id="2d7f-1892-2fd0-e29c"/>
    <categoryEntry name="Lieutenant" id="9082-e850-6a21-2918"/>
    <categoryEntry name="Grenades" id="5a61-81ac-eb7c-a87e"/>
    <categoryEntry name="Imperium" id="aff3-d6a3-2a95-9dc"/>
    <categoryEntry name="Configuration" id="4ac9-fd30-1e3d-b249"/>
    <categoryEntry name="Unit" id="1160-70ae-a862-b1a8"/>
  </categoryEntries>
  <forceEntries>
    <forceEntry id="bb9d-299a-ed60-2d8a" name="Army Roster" hidden="false">
      <categoryLinks>
        <categoryLink name="Configuration" id="d5de-ee57-ad4b-e4b7" targetId="4ac9-fd30-1e3d-b249"/>
        <categoryLink id="c932-1176-dc9-b390" name="New Category (link)" hidden="false" targetId="9cfd-1c32-585f-7d5c" primary="false">
          <constraints>
            <constraint field="selections" scope="roster" value="1" percentValue="false" shared="true" includeChildSelections="true" includeChildForces="true" id="f08b-2179-601f-9af" type="min"/>
          </constraints>
        </categoryLink>
        <categoryLink name="Battleline" id="b3ba-1e1a-a92d-60d2" targetId="e338-111e-d0c6-b687" type="category"/>
        <categoryLink name="Dedicated Transport" id="cf3e-2c24-fe34-39f9" targetId="ba07-411c-2832-1f79" type="category"/>
        <categoryLink name="Unit" id="a41a-6330-4718-d8d2" targetId="1160-70ae-a862-b1a8" type="category"/>
      </categoryLinks>
    </forceEntry>
  </forceEntries>
  <sharedSelectionEntries>
    <sharedSelectionEntry id="c319-bbad-fe73-950e" name="Bolt Pistol" hidden="false" collective="false" import="true" type="upgrade">
      <profiles>
        <profile id="3af1-4ce9-864-6332" name="Bolt Pistol" hidden="false" typeId="f77d-b953-8fa4-b762" typeName="Ranged Weapon">
          <modifiers>
            <modifier type="set" field="94d-8a98-cf90-183e" value="2+">
              <conditionGroups>
                <conditionGroup type="or" id="4349-8e06-e39a-76c7">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" id="6fe4-3dce-902a-211b" childId="9082-e850-6a21-2918" shared="true"/>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" id="6fe4-3dce-902a-211b" childId="2d7f-1892-2fd0-e29c" shared="true"/>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" id="6fe4-3dce-902a-211b" childId="4f3a-f0f7-6647-348d" shared="true"/>
                  </conditions>
                </conditionGroup>
              </conditionGroups>
            </modifier>
          </modifiers>
          <characteristics>
            <characteristic name="Range" typeId="9896-9419-16a1-92fc">12&quot;</characteristic>
            <characteristic name="A" typeId="3bb-c35f-f54-fb08">1</characteristic>
            <characteristic name="BS" typeId="94d-8a98-cf90-183e"/>
            <characteristic name="S" typeId="2229-f494-25db-c5d3">4</characteristic>
            <characteristic name="AP" typeId="9ead-8a10-520-de15"/>
            <characteristic name="D" typeId="a354-c1c8-a745-f9e3">1</characteristic>
          </characteristics>
        </profile>
      </profiles>
      <costs>
        <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
        <cost name="pl" typeId="c5fb-5b9b-89f6-86c" value="0"/>
      </costs>
      <infoLinks>
        <infoLink name="Pistol" id="b9ed-e737-fc66-815c" type="profile" targetId="a0e5-6744-b1d2-3786"/>
        <infoLink name="Pistol" id="c173-eed6-c0b0-4a5a" type="rule" targetId="8bf7-8812-923d-29e4">
          <infoLinks>
            <infoLink name="Pistol" id="5b96-9400-3bb-6ac3" type="rule" targetId="8bf7-8812-923d-29e4"/>
          </infoLinks>
        </infoLink>
      </infoLinks>
    </sharedSelectionEntry>
    <sharedSelectionEntry type="upgrade" import="true" name="Heavy Bolt Pistol" id="c4d0-5190-3fdb-e16a">
      <profiles>
        <profile name="Heavy Bolt Pistol [PISTOL]" id="abcf-e73c-b95a-1263" typeName="Ranged Weapon" typeId="f77d-b953-8fa4-b762">
          <characteristics>
            <characteristic name="Range" typeId="9896-9419-16a1-92fc">18&quot;</characteristic>
            <characteristic name="A" typeId="3bb-c35f-f54-fb08">1</characteristic>
            <characteristic name="BS" typeId="94d-8a98-cf90-183e">3+</characteristic>
            <characteristic name="S" typeId="2229-f494-25db-c5d3">4</characteristic>
            <characteristic name="AP" typeId="9ead-8a10-520-de15">-1</characteristic>
            <characteristic name="D" typeId="a354-c1c8-a745-f9e3">1</characteristic>
          </characteristics>
          <modifiers>
            <modifier type="set" field="94d-8a98-cf90-183e" value="2+">
              <conditionGroups>
                <conditionGroup type="or" id="59c8-98f0-76bd-943c">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" id="6fe4-3dce-902a-211b" childId="9082-e850-6a21-2918" shared="true"/>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" id="6fe4-3dce-902a-211b" childId="2d7f-1892-2fd0-e29c" shared="true"/>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" id="6fe4-3dce-902a-211b" childId="4f3a-f0f7-6647-348d" shared="true"/>
                  </conditions>
                </conditionGroup>
              </conditionGroups>
            </modifier>
          </modifiers>
        </profile>
      </profiles>
    </sharedSelectionEntry>
    <sharedSelectionEntry type="upgrade" import="true" name="Close Combat Weapon" id="ed8-b467-c84f-e324">
      <infoLinks>
        <infoLink name="Close Combat Weapon" id="a97-27c3-90d3-de5b" type="profile" targetId="6068-638d-18e6-8c22"/>
      </infoLinks>
    </sharedSelectionEntry>
    <sharedSelectionEntry type="upgrade" import="true" name="Master-crafted Bolt Rifle" id="6768-5a70-fc2f-ed3d">
      <profiles>
        <profile name="Master-crafted Bolt Rifle" id="1d7c-6821-1c30-eda6" typeName="Ranged Weapon" typeId="f77d-b953-8fa4-b762">
          <characteristics>
            <characteristic name="Range" typeId="9896-9419-16a1-92fc">24&quot;</characteristic>
            <characteristic name="A" typeId="3bb-c35f-f54-fb08">2</characteristic>
            <characteristic name="BS" typeId="94d-8a98-cf90-183e">3+</characteristic>
            <characteristic name="S" typeId="2229-f494-25db-c5d3">4</characteristic>
            <characteristic name="AP" typeId="9ead-8a10-520-de15">-1</characteristic>
            <characteristic name="D" typeId="a354-c1c8-a745-f9e3">1</characteristic>
          </characteristics>
          <modifiers>
            <modifier type="set" field="94d-8a98-cf90-183e" value="2+">
              <conditionGroups>
                <conditionGroup type="or" id="47c0-2956-2c46-38fd">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" id="6fe4-3dce-902a-211b" childId="9082-e850-6a21-2918" shared="true"/>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" id="6fe4-3dce-902a-211b" childId="2d7f-1892-2fd0-e29c" shared="true"/>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" id="6fe4-3dce-902a-211b" childId="4f3a-f0f7-6647-348d" shared="true"/>
                  </conditions>
                </conditionGroup>
              </conditionGroups>
            </modifier>
          </modifiers>
        </profile>
      </profiles>
    </sharedSelectionEntry>
    <sharedSelectionEntry type="upgrade" import="true" name="Plasma Pistol" id="3d3f-d559-46df-5bf3">
      <profiles>
        <profile name="Standard [PISTOL]" id="2f87-81ec-fe52-48f6" typeName="Ranged Weapon" typeId="f77d-b953-8fa4-b762">
          <characteristics>
            <characteristic name="Range" typeId="9896-9419-16a1-92fc">12&quot;</characteristic>
            <characteristic name="A" typeId="3bb-c35f-f54-fb08">1</characteristic>
            <characteristic name="BS" typeId="94d-8a98-cf90-183e">3+</characteristic>
            <characteristic name="S" typeId="2229-f494-25db-c5d3">7</characteristic>
            <characteristic name="AP" typeId="9ead-8a10-520-de15">-2</characteristic>
            <characteristic name="D" typeId="a354-c1c8-a745-f9e3">1</characteristic>
          </characteristics>
          <modifiers>
            <modifier type="set" field="94d-8a98-cf90-183e" value="2+">
              <conditionGroups>
                <conditionGroup type="or" id="cd07-19c2-801a-9691">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" id="6fe4-3dce-902a-211b" childId="9082-e850-6a21-2918" shared="true"/>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" id="6fe4-3dce-902a-211b" childId="2d7f-1892-2fd0-e29c" shared="true"/>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" id="6fe4-3dce-902a-211b" childId="4f3a-f0f7-6647-348d" shared="true"/>
                  </conditions>
                </conditionGroup>
              </conditionGroups>
            </modifier>
          </modifiers>
        </profile>
        <profile name="Supercharged [HAZARDOUS] [PISTOL]" id="3fd5-c8be-caf2-4c21" typeName="Ranged Weapon" typeId="f77d-b953-8fa4-b762">
          <characteristics>
            <characteristic name="Range" typeId="9896-9419-16a1-92fc">12&quot;</characteristic>
            <characteristic name="A" typeId="3bb-c35f-f54-fb08">1</characteristic>
            <characteristic name="BS" typeId="94d-8a98-cf90-183e">3+</characteristic>
            <characteristic name="S" typeId="2229-f494-25db-c5d3">8</characteristic>
            <characteristic name="AP" typeId="9ead-8a10-520-de15">-3</characteristic>
            <characteristic name="D" typeId="a354-c1c8-a745-f9e3">2</characteristic>
          </characteristics>
          <modifiers>
            <modifier type="set" field="94d-8a98-cf90-183e" value="2+">
              <conditionGroups>
                <conditionGroup type="or" id="dd09-a754-83ff-ff15">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" id="6fe4-3dce-902a-211b" childId="9082-e850-6a21-2918" shared="true"/>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" id="6fe4-3dce-902a-211b" childId="2d7f-1892-2fd0-e29c" shared="true"/>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" id="6fe4-3dce-902a-211b" childId="4f3a-f0f7-6647-348d" shared="true"/>
                  </conditions>
                </conditionGroup>
              </conditionGroups>
            </modifier>
          </modifiers>
        </profile>
      </profiles>
      <infoLinks>
        <infoLink name="New Rule" id="f1fa-798b-57db-4823" type="rule" targetId="8367-374c-f87-c627"/>
        <infoLink name="Pistol" id="7bcb-60d7-617b-126f" type="rule" targetId="8bf7-8812-923d-29e4"/>
      </infoLinks>
    </sharedSelectionEntry>
    <sharedSelectionEntry type="upgrade" import="true" name="Master-crafted Power Weapon" id="1bd3-4f38-938c-db9e">
      <infoLinks>
        <infoLink name="Master-crafted Power Weapon" id="55db-acad-68d3-5003" type="profile" targetId="aa48-83ca-be23-1a39"/>
      </infoLinks>
    </sharedSelectionEntry>
    <sharedSelectionEntry type="upgrade" import="true" name="Leader" id="5edc-5517-c4bb-d16b">
      <infoLinks>
        <infoLink name="Leader" id="c7cd-36e4-e75-9d17" type="profile" targetId="b342-fa4-10e1-2394"/>
        <infoLink name="Leader" id="6ac4-b632-4a64-ae1e" type="rule" targetId="b4dd-3e1f-41cb-218f"/>
      </infoLinks>
    </sharedSelectionEntry>
    <sharedSelectionEntry type="upgrade" import="true" name="Power Fist" id="5b4-55e7-90c6-d7ec">
      <profiles>
        <profile name="Power Fist" id="76d9-253e-c08-459d" typeName="Melee Weapon" typeId="8a40-4aaa-c780-9046">
          <characteristics>
            <characteristic name="Range" typeId="914c-b413-91e3-a132">Melee</characteristic>
            <characteristic name="A" typeId="2337-daa1-6682-b110">5</characteristic>
            <characteristic name="WS" typeId="95d1-95f-45b4-11d6">3+</characteristic>
            <characteristic name="S" typeId="ab33-d393-96ce-ccba">8</characteristic>
            <characteristic name="AP" typeId="41a0-1301-112a-e2f2">-2</characteristic>
            <characteristic name="D" typeId="3254-9fe6-d824-513e">2</characteristic>
          </characteristics>
          <modifiers>
            <modifier type="set" field="95d1-95f-45b4-11d6" value="2+">
              <conditionGroups>
                <conditionGroup type="or" id="8ce6-8200-d30b-83e2">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" id="6fe4-3dce-902a-211b" childId="9082-e850-6a21-2918" shared="true"/>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" id="6fe4-3dce-902a-211b" childId="2d7f-1892-2fd0-e29c" shared="true"/>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" id="6fe4-3dce-902a-211b" childId="4f3a-f0f7-6647-348d" shared="true"/>
                  </conditions>
                </conditionGroup>
              </conditionGroups>
            </modifier>
          </modifiers>
        </profile>
      </profiles>
    </sharedSelectionEntry>
    <sharedSelectionEntry type="upgrade" import="true" name="Neo-Volkite Pistol" id="e6a7-b974-4ab6-592b">
      <profiles>
        <profile name="Neo-volkite Pisol [Devastating wounds, Pistol]" id="6b08-7f7b-2ba4-7240" typeName="Ranged Weapon" typeId="f77d-b953-8fa4-b762">
          <characteristics>
            <characteristic name="Range" typeId="9896-9419-16a1-92fc">12&quot;</characteristic>
            <characteristic name="A" typeId="3bb-c35f-f54-fb08">1</characteristic>
            <characteristic name="BS" typeId="94d-8a98-cf90-183e">3+</characteristic>
            <characteristic name="S" typeId="2229-f494-25db-c5d3">5</characteristic>
            <characteristic name="AP" typeId="9ead-8a10-520-de15">0</characteristic>
            <characteristic name="D" typeId="a354-c1c8-a745-f9e3">2</characteristic>
          </characteristics>
        </profile>
      </profiles>
    </sharedSelectionEntry>
  </sharedSelectionEntries>
  <sharedProfiles>
    <sharedProfile name="Deadly Demise" id="b0f9-c74-735c-2d3" typeName="Abilities" typeId="9cc3-6d83-4dd3-9b64">
      <characteristics>
        <characteristic name="Description" typeId="9b8f-694b-e5e-b573">When this model is destroyed, roll one D6. On a 6, each unit within 6&quot; suffers ‘x’ mortal wounds.</characteristic>
      </characteristics>
    </sharedProfile>
    <sharedProfile name="Deepstrike" id="a039-4492-1af0-ffbc" typeName="Abilities" typeId="9cc3-6d83-4dd3-9b64">
      <characteristics>
        <characteristic name="Description" typeId="9b8f-694b-e5e-b573">- Unit can be set up in Reserves instead of on the battlefield.
- Unit can be set up in your Movement phase, more than 9&quot; horizontally away from all enemy models.</characteristic>
      </characteristics>
    </sharedProfile>
    <sharedProfile name="Feel No Pain" id="6b78-2820-71ba-ae34" typeName="Abilities" typeId="9cc3-6d83-4dd3-9b64">
      <characteristics>
        <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Each time this model would lose a wound, roll one D6: if the result equals or exceeds ‘x’, that wound is not lost.</characteristic>
      </characteristics>
    </sharedProfile>
    <sharedProfile name="Pistol" id="a0e5-6744-b1d2-3786" typeName="Abilities" typeId="9cc3-6d83-4dd3-9b64">
      <characteristics>
        <characteristic name="Description" typeId="9b8f-694b-e5e-b573"/>
      </characteristics>
    </sharedProfile>
    <sharedProfile name="Hazardous" id="f641-aa2b-9335-64a0" typeName="Abilities" typeId="9cc3-6d83-4dd3-9b64">
      <characteristics>
        <characteristic name="Description" typeId="9b8f-694b-e5e-b573"/>
      </characteristics>
    </sharedProfile>
    <sharedProfile name="Leader" id="b342-fa4-10e1-2394" typeName="Abilities" typeId="9cc3-6d83-4dd3-9b64">
      <characteristics>
        <characteristic name="Description" typeId="9b8f-694b-e5e-b573"/>
      </characteristics>
    </sharedProfile>
    <sharedProfile name="Close Combat Weapon" id="6068-638d-18e6-8c22" typeName="Melee Weapon" typeId="8a40-4aaa-c780-9046">
      <characteristics>
        <characteristic name="Range" typeId="914c-b413-91e3-a132">Melee</characteristic>
        <characteristic name="A" typeId="2337-daa1-6682-b110">6</characteristic>
        <characteristic name="WS" typeId="95d1-95f-45b4-11d6">2+</characteristic>
        <characteristic name="S" typeId="ab33-d393-96ce-ccba">4</characteristic>
        <characteristic name="AP" typeId="41a0-1301-112a-e2f2">0</characteristic>
        <characteristic name="D" typeId="3254-9fe6-d824-513e">1</characteristic>
      </characteristics>
      <modifiers>
        <modifier type="set" field="95d1-95f-45b4-11d6" value="2+">
          <conditionGroups>
            <conditionGroup type="or" id="9683-3bbe-5d58-3edb">
              <conditions>
                <condition type="instanceOf" value="1" field="selections" scope="ancestor" id="6fe4-3dce-902a-211b" childId="9082-e850-6a21-2918" shared="true"/>
                <condition type="instanceOf" value="1" field="selections" scope="ancestor" id="6fe4-3dce-902a-211b" childId="2d7f-1892-2fd0-e29c" shared="true"/>
                <condition type="instanceOf" value="1" field="selections" scope="ancestor" id="6fe4-3dce-902a-211b" childId="4f3a-f0f7-6647-348d" shared="true"/>
              </conditions>
            </conditionGroup>
          </conditionGroups>
        </modifier>
      </modifiers>
    </sharedProfile>
    <sharedProfile name="Master-crafted Power Weapon" id="aa48-83ca-be23-1a39" typeName="Melee Weapon" typeId="8a40-4aaa-c780-9046">
      <characteristics>
        <characteristic name="Range" typeId="914c-b413-91e3-a132">Melee</characteristic>
        <characteristic name="A" typeId="2337-daa1-6682-b110">6</characteristic>
        <characteristic name="WS" typeId="95d1-95f-45b4-11d6">3+</characteristic>
        <characteristic name="S" typeId="ab33-d393-96ce-ccba">5</characteristic>
        <characteristic name="AP" typeId="41a0-1301-112a-e2f2">-2</characteristic>
        <characteristic name="D" typeId="3254-9fe6-d824-513e">2</characteristic>
      </characteristics>
      <modifiers>
        <modifier type="set" field="95d1-95f-45b4-11d6" value="2+">
          <conditionGroups>
            <conditionGroup type="or" id="34b1-80da-4d05-1a8b">
              <conditions>
                <condition type="instanceOf" value="1" field="selections" scope="ancestor" id="6fe4-3dce-902a-211b" childId="9082-e850-6a21-2918" shared="true"/>
                <condition type="instanceOf" value="1" field="selections" scope="ancestor" id="6fe4-3dce-902a-211b" childId="2d7f-1892-2fd0-e29c" shared="true"/>
                <condition type="instanceOf" value="1" field="selections" scope="ancestor" id="6fe4-3dce-902a-211b" childId="4f3a-f0f7-6647-348d" shared="true"/>
              </conditions>
            </conditionGroup>
          </conditionGroups>
        </modifier>
      </modifiers>
    </sharedProfile>
  </sharedProfiles>
  <sharedRules>
    <sharedRule name="Pistol" id="8bf7-8812-923d-29e4" hidden="false">
      <description>Weapons with [PISTOL] in their profile are known as Pistols. If a unit contains any models equipped with Pistols, that unit is eligible to shoot in its controlling player’s Shooting phase even while it is within Engagement Range of one or more enemy units. When such a unit is selected to shoot, it can only resolve attacks using its Pistols and can only target one of the enemy units it is within Engagement Range of. In such circumstances, a Pistol can target an enemy unit even if other friendly units are within Engagement Range of the same enemy unit. 


If a model is equipped with one or more Pistols, unless it is a Monster or Vehicle model, it can either shoot with its Pistols or with all of its other ranged weapons. Declare whether such a model will shoot with its Pistols or its other ranged weapons before selecting targets.</description>
    </sharedRule>
    <sharedRule name="Hazardous" id="8367-374c-f87-c627">
      <description>Weapons with [HAZARDOUS] in their profile are known as Hazardous weapons. Each time a unit is selected to shoot or fight, if one or more models attack with Hazardous weapons, then after that unit has resolved all of its attacks, you must take one Hazardous test for each Hazardous weapon that was just used by rolling one D6. For each roll of 1, that test is failed and one model in that unit equipped with a Hazardous weapon is destroyed (selected by the controlling player), unless that model is a Character, Monster or Vehicle, in which case it suffers 3 mortal wounds instead. Note that if you selected a Character model in an Attached unit, the mortal wounds suffered must be allocated to that model first, even if there is another model in that unit that has lost one or more wounds or has had attacks allocated to it this phase.</description>
    </sharedRule>
    <sharedRule name="Leader" id="b4dd-3e1f-41cb-218f">
      <description>While a Bodyguard unit contains a Leader, it is known as an Attached unit and, with the exception of rules that are triggered when units are destroyed (pg 12), it is treated as a single unit for all rules purposes. Each time an attack targets an Attached unit, until the attacking unit has resolved all of its attacks, you must use the Toughness characteristic of the Bodyguard models in that unit, even if a Leader in that unit has a different Toughness characteristic. Each time an attack sucessfully wounds an Attached unit, that attack cannot be allocated to a Character model in that unit, even if that Character model has lost one or more wounds or has already had attacks allocated to it this phase. As soon as the last Bodyguard model in an Attached unit has been destroyed, any attacks made against that unit that have yet to be allocated can then be allocated to Character models in that unit.</description>
    </sharedRule>
    <sharedRule name="Devastating Wounds" id="be1e-ac8e-1e2c-3528">
      <description>Weapons with [DEVASTATING WOUNDS] in their profile are known as Devastating Wounds weapons. Each time an attack is made with such a weapon, a Critical Wound inflicts a number of mortal wounds on the target equal to the Damage characteristic of that weapon and the attack sequence ends.</description>
      <profiles>
        <profile name="Devastating Wounds" id="4af6-f565-3519-347e" typeName="Abilities" typeId="9cc3-6d83-4dd3-9b64">
          <characteristics>
            <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Weapons with [DEVASTATING WOUNDS] in their profile are known as Devastating Wounds weapons. Each time an attack is made with such a weapon, a Critical Wound inflicts a number of mortal wounds on the target equal to the Damage characteristic of that weapon and the attack sequence ends.</characteristic>
          </characteristics>
        </profile>
      </profiles>
    </sharedRule>
  </sharedRules>
</gameSystem>
